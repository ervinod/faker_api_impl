class ServerException implements Exception {}

class CacheException implements Exception {}

class ApiException implements Exception {
  final String message;
  final String strErrorCode;

  ApiException({required this.message, this.strErrorCode = ""});
}

class GeneralException implements Exception {}
