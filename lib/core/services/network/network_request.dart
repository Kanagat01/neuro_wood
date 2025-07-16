import 'package:camera/camera.dart';

class NetworkRequest {
  final List<String> baseUrl;
  final String path;
  final RestMethod method;
  final Map<String, String>? queryParams;
  final Map<String, dynamic>? body;
  final XFile? file;

  NetworkRequest({
    required this.path,
    required this.baseUrl,
    required this.method,
    this.queryParams,
    this.body,
    this.file,
  });

  bool get hasNextUrl => baseUrl.length > 1;

  NetworkRequest nextUrl() => NetworkRequest(
    path: path,
    baseUrl: baseUrl.sublist(1),
    method: method,
    queryParams: queryParams,
    body: body,
    file: file,
  );
}

extension NetworkRequestLogging on NetworkRequest {
  String toLog() {
    return '''NetworkRequest:
  baseUrl: $baseUrl,
  path: $path,
  method: ${method.name},
  queryParams: $queryParams,
  body: $body,
  filePath: ${file?.path},
''';
  }
}

enum RestMethod { get, post, patch, delete, put }
