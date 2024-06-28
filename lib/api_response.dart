class ApiResponse {
  Object? data;
  String? error;
}

extension ApiResponseExtension on ApiResponse {
  bool isResponseSuccess() {
    return data != null && error == null;
  }
}
