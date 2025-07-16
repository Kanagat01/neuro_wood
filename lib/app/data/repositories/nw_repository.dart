import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/image_recognize_request.dart';
import 'package:neuro_wood/app/domain/entities/measure_response.dart';
import 'package:neuro_wood/app/domain/repositories/i_nw_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';
import 'package:neuro_wood/core/services/network/network_error.dart';
import 'package:neuro_wood/core/services/network/network_request.dart';
import 'package:neuro_wood/core/services/network/network_service.dart';

class NWRepository implements INWRepository {
  NWRepository({
    required this.networkService,
    required this.firebaseDataSource,
  });
  final NetworkService networkService;
  final FirebaseDataSource firebaseDataSource;

  static const String _baseUrl = "http://51.250.91.201:81/";

  File createFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }

    return file;
  }

  @override
  Future<Either<ServerFailure, MeasureResponse>> processImage(
    ImageRecognizeRequest request,
  ) async {
    final baseUrls = <String>[];
    final urlEither = await firebaseDataSource.getSendUrls();
    urlEither.fold((l) => null, (r) {
      prepare(String? s) {
        final uri = Uri.tryParse(s ?? '');
        if ((uri?.isAbsolute ?? false) && !baseUrls.contains(uri.toString())) {
          baseUrls.add(uri.toString());
        }
      }

      prepare(r.baseUrl);
      prepare(r.backupUrl);
    });
    if (!baseUrls.contains(_baseUrl)) {
      baseUrls.add(_baseUrl);
    }

    final body = request.toRequest(firebaseDataSource.user!.uid);
    // final image = await _compressFile(request.image);
    NetworkRequest req = NetworkRequest(
      path: 'files/',
      baseUrl: baseUrls,
      method: RestMethod.post,
      file: request.image,
      body: body,
      // {
      //   "truck_length": request.length,
      //   "sortiment": request.timberType.name,
      //   "location": request.location.name,
      //   "breed": request.treeSpecies.name,
      //   "user_id": firebaseDataSource.user!.uid,
      //   "use_depth": request.useDepth,
      // },
    );

    try {
      final result = await networkService.sendRequest(req);
      if (result.body is Map) {
        try {
          Map<String, dynamic> body = result.body;
          if (body.containsKey('recognition_id')) {
            final stream = firebaseDataSource.subscribeOnMeasure(
              body['recognition_id'],
            );
            return right(
              MeasureResponse(
                measureId: body['recognition_id'],
                licensePlateText: body['license_plate_text'] != null
                    ? body['license_plate_text']?.trim() ?? ''
                    : '',
                measureStream: stream,
              ),
            );
          }
          // var format = DateFormat('MM:dd:y_H:mm:ss');
          // body['date_time'] = format.parse(body['measure_id'], true).toLocal();
          // final res = ImageRecognizeResultModel.fromMap(body);
          // return right(res);
        } catch (e, s) {
          await firebaseDataSource.crashlytics.recordErrorWithLogs(
            logs: ['request - ${req.toLog()}', 'response - ${result.body}'],
            exception: e,
            stack: s,
            reason: 'Not valid response',
          );
          return left(ServerFailure(ServerFailureCode.parseResponseError));
        }
      }
      await firebaseDataSource.crashlytics.recordErrorWithLogs(
        logs: ['request - ${req.toLog()}', 'response - ${result.body}'],
        exception: 'Invalid response format',
      );
      return left(ServerFailure(ServerFailureCode.parseResponseError));
    } on NetworkError catch (e, _) {
      await firebaseDataSource.crashlytics.log('request - ${req.toLog()}');
      if (e.code == 404) {
        await firebaseDataSource.crashlytics.recordError(
          exception: e,
          reason: 'Number not recognized',
        );
        return left(ServerFailure(ServerFailureCode.uknownNumber));
      } else if (e.code != null) {
        await firebaseDataSource.crashlytics.recordError(
          exception: e.error,
          reason: 'Server error',
        );
        return left(ServerFailure(ServerFailureCode.serverError));
      }
      await firebaseDataSource.crashlytics.recordError(
        exception: e.error,
        reason: 'Sending error',
      );
      return left(ServerFailure(ServerFailureCode.sendError));
    } catch (e, s) {
      await firebaseDataSource.crashlytics.recordErrorWithLogs(
        logs: ['request - ${req.toLog()}'],
        exception: e,
        stack: s,
        reason: 'Unknown error',
      );
      return left(ServerFailure(ServerFailureCode.sendError));
    }
  }
}
