import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _fss = FirebaseStorage.instance;

  Future<String?> getMeasureImage(String uid, String measureId) async {
    final ref = _fss.ref().child(uid).child(measureId);
    final ress = await ref.list();
    return await ress.items
        .firstWhereOrNull((e) => e.name.startsWith('image'))
        ?.getDownloadURL();
  }

  Future<String?> getMeasureReport(String uid, String measureId) async {
    final ref = _fss.ref().child(uid).child(measureId);
    final files = await ref.list();
    Reference? file = files.items.firstWhereOrNull(
      (e) => e.name == 'report.pdf',
    );

    return await file?.getDownloadURL();
  }

  Future<bool> saveMeasureReport({
    required String uid,
    required String measureId,
    required File file,
  }) async {
    Completer<bool> completer = Completer<bool>();
    final metadata = SettableMetadata(contentType: "application/pdf");
    final ref = _fss.ref().child('$uid/$measureId/report.pdf');
    final uploadTask = ref.putFile(file, metadata);
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          log("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          log("Upload is paused.");
          break;
        case TaskState.canceled:
          log("Upload was canceled");
          break;
        case TaskState.error:
          if (!completer.isCompleted) {
            completer.complete(false);
          }
          break;
        case TaskState.success:
          if (!completer.isCompleted) {
            completer.complete(true);
          }
          break;
      }
    });
    return await completer.future;
  }
}
