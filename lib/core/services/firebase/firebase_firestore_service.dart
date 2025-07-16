import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/data/model/user_model.dart';
import 'package:neuro_wood/core/failure/failure.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static const String _userCollection = "users";
  static const String _userAdditionalCollection = "users_additional_data";
  static const String _locationsCollection = "locations";
  static const String _timberTypeCollection = "timber_type";
  static const String _treeSpeciesCollection = "tree_species";
  static const String _parametersMeasure = "parameters_measure";
  static const String _params = "params";
  static const String _recognitionResults = "recognition_results";
  static const String _recognition = "recognition";
  static const String _subscriptionDescription = "subscriptions_description";
  static const String _subscriptionBusiness = "subscriptions_business";
  late final DateFormat _formatId = DateFormat('MM:dd:y_H:mm:ss', 'ru');

  FirebaseFirestoreService() {
    // if (kDebugMode) {
    //   _fireStore.settings = const Settings(persistenceEnabled: false, sslEnabled: false);
    //   _fireStore.useFirestoreEmulator('localhost', 5010);
    // }
  }

  Future<Map<String, dynamic>> getUserByUid(String uid) async {
    final rawUser = await _getUserSnapshot(uid);
    if (rawUser.exists) {
      final additionalData = await getUserAdditionalDataByUid(uid);
      final map = <String, dynamic>{};
      map.addAll(rawUser.data()!);
      map['additional'] = additionalData;
      return map;
    }
    throw Exception();
  }

  Future<Map<String, dynamic>> getUserAdditionalDataByUid(String uid) async {
    final collection = _fireStore.collection(_userAdditionalCollection);
    final rawData = await collection.doc(uid).get();
    if (rawData.exists) {
      return rawData.data()!;
    }
    return {
      'uid': uid,
    };
  }

  Future<bool> setUser(UserModel user) async {
    final userCollection = _fireStore.collection(_userCollection);
    final doc = user.toDoc();
    // doc.addAll(other)
    await userCollection.doc(user.uid).set(doc);
    return true;
  }

  Stream<Map<String, dynamic>?> subscribeOnMeasure(
      String uid, String measureId) {
    final userDoc = _fireStore
        .collection(_recognitionResults)
        .doc(uid)
        .collection(_recognition)
        .doc(measureId);
    return userDoc.snapshots().map((d) {
      Map<String, dynamic>? data = d.data();
      if (data != null) {
        data['date_time'] = _formatId.parse(data['measure_id'], true).toLocal();
      }
      return data;
    });
  }

  Future<bool> updateUser(UserModel user) async {
    final userCollection = _fireStore.collection(_userCollection);
    final rawUser = await userCollection.doc(user.uid).get();
    if (rawUser.exists) {
      await userCollection.doc(user.uid).update(user.toUpdateUserData());
      return true;
    } else {
      await userCollection.doc(user.uid).set(user.toUpdateUserData());
      return true;
    }
  }

  Future<bool> updateUserMeasurements(
      Map<String, dynamic> data, String uid) async {
    final userCollection = _fireStore.collection(_userCollection);
    final rawUser = await userCollection.doc(uid).get();
    if (rawUser.exists) {
      await userCollection.doc(uid).update(data);
      return true;
    } else {
      await userCollection.doc(uid).set(data);
      return true;
    }
  }

  Future<void> setAdditional(UserAdditionalModel data) async {
    final userCollection = _fireStore.collection(_userAdditionalCollection);
    final rawUser = await userCollection.doc(data.uid).get();
    if (rawUser.exists) {
      return await userCollection.doc(data.uid).update(data.toDoc());
    } else {
      return await userCollection.doc(data.uid).set(data.toDoc());
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserSnapshot(
      String uid) async {
    final userCollection = _fireStore.collection(_userCollection);
    return await userCollection.doc(uid).get();
  }

  @Deprecated('use getAllParameters')
  Future<List<Map<String, dynamic>>> getLocations() async {
    return await _getAllDocsInCollection(_locationsCollection);
  }

  @Deprecated('use getAllParameters')
  Future<List<Map<String, dynamic>>> getTimberTypes() async {
    return await _getAllDocsInCollection(_timberTypeCollection);
  }

  @Deprecated('use getAllParameters')
  Future<List<Map<String, dynamic>>> getTreeSpecies() async {
    return await _getAllDocsInCollection(_treeSpeciesCollection);
  }

  Future<Map<String, dynamic>> getAllParameters() async {
    final snapshot =
        await _fireStore.collection(_parametersMeasure).doc(_params).get();
    return snapshot.data()!;
  }

  Future<List<Map<String, dynamic>>> getMeasures(String uid) async {
    final userDoc =
        await _fireStore.collection(_recognitionResults).doc(uid).get();
    if (!userDoc.exists) {
      throw FirestoreFailure('emptyResults');
    }
    final measures = await userDoc.reference.collection(_recognition).get();
    final docs = measures.docs;
    List<Map<String, dynamic>> res = [];
    for (final docSnapshot in docs) {
      res.add(_prepareMeasureDoc(docSnapshot));
    }
    return res;
  }

  Map<String, dynamic> _prepareMeasureDoc(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data();
    data['measure_id'] = snapshot.id;
    data['date_time'] = _formatId.parse(snapshot.id, true).toLocal();
    return data;
  }

  Stream<List<Map<String, dynamic>>?> getStreamMesures(String uid) {
    final stream = _fireStore
        .collection(_recognitionResults)
        .doc(uid)
        .collection(_recognition)
        .snapshots();
    return stream
        .map((qs) => qs.docs.map((e) => _prepareMeasureDoc(e)).toList());
  }

  Future<List<Map<String, dynamic>>> _getAllDocsInCollection(
    String collectionName,
  ) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _fireStore.collection(collectionName).get();
    final docs = snapshot.docs;
    return docs.map((e) => e.data()).toList();
  }

  Future<Map<String, dynamic>> getSubscriptions() async {
    final subs =
        await _fireStore.collection(_subscriptionDescription).doc("subs").get();
    if (subs.exists) {
      return subs.data()!;
    }
    throw FirestoreFailure();
  }

  Future<Map<String, dynamic>> getSubscriptionsBusiness() async {
    final subs =
        await _fireStore.collection(_subscriptionBusiness).doc("tarifs").get();
    if (subs.exists) {
      return subs.data()!;
    }
    throw FirestoreFailure();
  }

  Future<Map<String, dynamic>> getSendUrls() async {
    final urls =
        await _fireStore.collection(_parametersMeasure).doc(_params).get();
    if (urls.exists) {
      return urls.data()!;
    }
    throw FirestoreFailure();
  }

  Future<void> setMeasureData({
    required String uid,
    required String measureId,
    required Map<String, dynamic> data,
  }) async {
    final doc = _fireStore
        .collection(_recognitionResults)
        .doc(uid)
        .collection(_recognition)
        .doc(measureId);
    if ((await doc.get()).exists) {
      return doc.update(data);
    }
    throw FirestoreFailure('Document is not exist');
  }
}
