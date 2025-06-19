import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:neuro_wood/core/services/network/network_response.dart';
import 'network_error.dart';
import 'network_request.dart';

class NetworkService {
  final Dio _dio = Dio(BaseOptions());

  NetworkService();

  final Map<String, dynamic> _headers = const {
    'accept': "application/json",
    'Content-Type': 'multipart/form-data',
  };

  ///throwable NetworkError()
  Future<NetworkResponse> sendRequest(NetworkRequest request) async {
    try {
      log('╔════Network: Request═══───');
      log('║ request.headers $_headers');
      log('║ request.uri ${request.baseUrl.first}${request.path}');
      log('║ request.data ${request.body}');
      log('║ request.method ${request.method}');
      log('╚═══════════════════════───');
      _dio.options.baseUrl = request.baseUrl.first;
      _dio.options.sendTimeout = const Duration(seconds: 90);
      FormData data = FormData.fromMap(request.body ?? {});

      if (request.file != null) {
        data.files.add(
          MapEntry('file', await MultipartFile.fromFile(request.file!.path)),
        );
        if (data.files.isEmpty) {
          throw NetworkError(error: 'Failed to attach image');
        }
      }
      Future<Response> req;
      switch (request.method) {
        case RestMethod.get:
          req = _dio.get(
            request.path,
            options: Options(headers: _headers),
            queryParameters: request.queryParams ?? {},
          );
          break;
        case RestMethod.post:
          req = _dio.post(
            request.path,
            options: Options(headers: _headers),
            queryParameters: request.queryParams ?? {},
            data: data,
          );
          break;
        case RestMethod.patch:
          req = _dio.patch(
            request.path,
            options: Options(headers: _headers),
            queryParameters: request.queryParams ?? {},
            data: data,
          );
          break;
        case RestMethod.delete:
          req = _dio.delete(
            request.path,
            options: Options(headers: _headers),
            queryParameters: request.queryParams ?? {},
          );
          break;
        case RestMethod.put:
          req = _dio.put(
            request.path,
            options: Options(headers: _headers),
            queryParameters: request.queryParams ?? {},
            data: data,
          );
          break;
      }
      Response r = await req;
      log('╔════Network: Resposne═══───');
      log('║ request.data ${r.data}');
      log('╚═══════════════════════───');
      return NetworkResponse(
        headers: r.headers.map,
        body: r.data,
        code: r.statusCode!,
      );
    } on DioException catch (e) {
      if (((e.response?.statusCode ?? 0) >= 500 && request.hasNextUrl) ||
          (e.type == DioExceptionType.unknown &&
              e.error is SocketException &&
              (e.error as SocketException).message == "Connection refused")) {
        return sendRequest(request.nextUrl());
      }
      throw NetworkError(
        code: e.response?.statusCode,
        response: e.response?.data,
        error: e,
      );
    } catch (e, s) {
      log(e.toString());
      throw NetworkError(error: [e, s]);
    }
  }
}

extension NetworkRequestToDio on NetworkRequest {
  Future<RequestOptions> convert({Map<String, dynamic>? headers}) async {
    FormData data = FormData.fromMap(body ?? {});

    if (file != null) {
      data.files.add(
        MapEntry('file', await MultipartFile.fromFile(file!.path)),
      );
    }

    return RequestOptions(
      method: method.name,
      path: path,
      headers: headers,
      queryParameters: queryParams,
      data: data,
      baseUrl: baseUrl.first,
    );
  }
}
