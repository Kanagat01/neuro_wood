import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

import 'network_error.dart';
import 'network_request.dart';
import 'network_response.dart';

class NetworkService {
  final http.Client _client = http.Client();
  final Map<String, String> _headers = {'accept': 'application/json'};

  Future<NetworkResponse> sendRequest(NetworkRequest request) async {
    try {
      final uri = _buildUri(request);
      final method = request.method.toString().split('.').last.toUpperCase();

      log('╔════Network: Request═══───');
      log('║ URI: $uri');
      log('║ Method: $method');
      log('║ Headers: $_headers');

      if (request.file != null) {
        return await _sendMultipartRequest(request, uri);
      } else {
        return await _sendRegularRequest(request, uri);
      }
    } on NetworkError {
      rethrow;
    } catch (e, s) {
      log('Unexpected error: $e\n$s');
      throw NetworkError(error: e, response: null);
    }
  }

  Uri _buildUri(NetworkRequest request) {
    var uri = Uri.parse(request.baseUrl.first + request.path);

    if (request.queryParams != null) {
      uri = uri.replace(
        queryParameters: {...uri.queryParameters, ...request.queryParams!},
      );
    }

    return uri;
  }

  Future<NetworkResponse> _handleResponse(
    http.StreamedResponse response,
    NetworkRequest request,
  ) async {
    final responseBody = await response.stream.bytesToString();
    final statusCode = response.statusCode;

    log('╔════Network: Response═══───');
    log('║ Status: $statusCode');
    log('║ Body: $responseBody');
    log('║ Headers: ${response.headers}');
    log('╚═══════════════════════───');

    if (statusCode == 200) {
      return NetworkResponse(
        headers: response.headers,
        body: json.decode(responseBody),
        code: statusCode,
      );
    } else if (statusCode == 422) {
      throw NetworkError(
        code: 422,
        response: json.decode(responseBody),
        error: 'Unprocessable Entity',
      );
    } else {
      if ((statusCode >= 500 && request.hasNextUrl) ||
          statusCode == HttpStatus.serviceUnavailable) {
        return sendRequest(request.nextUrl());
      }

      throw NetworkError(
        code: statusCode,
        response: json.decode(responseBody),
        error: 'Server error',
      );
    }
  }

  Future<(Uint8List, String)> _prepareImageFast(String imagePath) async {
    final file = File(imagePath);
    final bytes = await file.readAsBytes();
    final filename = '${path.basenameWithoutExtension(imagePath)}.jpg';

    final compressed = await FlutterImageCompress.compressWithList(
      bytes,
      quality: 90,
      minWidth: 1080,
      minHeight: 720,
    );
    return (compressed, filename);
  }

  Future<NetworkResponse> _sendMultipartRequest(
    NetworkRequest request,
    Uri uri,
  ) async {
    try {
      var multipartRequest = http.MultipartRequest('POST', uri);
      multipartRequest.headers.addAll(_headers);
      if (request.body != null) {
        request.body!.forEach((key, value) {
          multipartRequest.fields[key] = value.toString();
        });
      }
      final (imageBytes, filename) = await _prepareImageFast(
        request.file!.path,
      );
      if (imageBytes.isNotEmpty) {
        multipartRequest.files.add(
          http.MultipartFile.fromBytes(
            'file',
            imageBytes,
            filename: filename,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      }

      log('║ Body Fields: ${multipartRequest.fields}');
      log('║ Files: ${multipartRequest.files.map((f) => f.filename)}');
      log('║ File Size: ${imageBytes.length} bytes');
      log('║ File Type: image/jpeg');
      log('╚═══════════════════════───');

      final response = await _client.send(multipartRequest);
      return await _handleResponse(response, request);
    } on SocketException catch (e) {
      throw NetworkError(error: e, response: null);
    }
  }

  Future<NetworkResponse> _sendRegularRequest(
    NetworkRequest request,
    Uri uri,
  ) async {
    try {
      final method = request.method.toString().split('.').last.toUpperCase();

      final http.Request httpRequest = http.Request(method, uri);
      httpRequest.headers.addAll(_headers);

      if (request.body != null && ['POST', 'PUT', 'PATCH'].contains(method)) {
        httpRequest.body = json.encode(request.body);
        log('║ Body: ${request.body}');
      }

      log('╚═══════════════════════───');

      final response = await _client.send(httpRequest);
      return await _handleResponse(response, request);
    } on SocketException catch (e) {
      throw NetworkError(error: e, response: null);
    }
  }
}
