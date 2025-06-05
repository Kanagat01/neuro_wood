class NetworkResponse {
  final Map headers;
  final dynamic body;
  final int code;

  NetworkResponse({
    required this.headers,
    required this.body,
    required this.code,
  });
}
