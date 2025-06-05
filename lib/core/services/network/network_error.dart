class NetworkError implements Exception{
  final dynamic response;
  final int? code;
  final dynamic error;

  NetworkError({
    this.response,
    this.code,
    this.error,
  });

  @override
  String toString() {
    return 'NetworkError(code: $code, error: $error)';
  }
}
