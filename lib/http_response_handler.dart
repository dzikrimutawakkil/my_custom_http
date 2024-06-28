import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_custom_http/api_response.dart';

mixin HttpResponseHandlerMixin {
  void handleResponse(ApiResponse apiResponse, http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        apiResponse.data = response.body.isNotEmpty
            ? json.decode(response.body)['data'] ??
                json.decode(response.body)['message']
            : null;
        break;
      case 202:
        apiResponse.data = response.body.isNotEmpty
            ? json.decode(response.body)['data']
            : null;
        break;
      case 204:
        apiResponse.error = 'No Content';
        apiResponse.data = null;
        break;
      case 301:
      case 302:
        apiResponse.error = 'Redirect';
        apiResponse.data = response.headers['location'];
        break;
      case 304:
        apiResponse.error = 'Not Modified';
        break;
      case 400:
      case 422:
      case 403:
      case 429:
        apiResponse.error = response.body.isNotEmpty
            ? json.decode(response.body)['message']
            : 'Bad Request';
        break;
      case 401:
        apiResponse.error = 'Unauthorized';
        break;
      case 404:
        apiResponse.error = 'Not Found';
        break;
      case 500:
        apiResponse.error = 'Internal Server Error';
        break;
      case 502:
        apiResponse.error = 'Bad Gateway';
        break;
      case 503:
        apiResponse.error = 'Service Unavailable';
        break;
      case 504:
        apiResponse.error = 'Gateway Timeout';
        break;
      default:
        apiResponse.error = 'Unexpected Error';
        break;
    }
  }

  FutureOr<http.Response> handleError(dynamic error, StackTrace? stackTrace) {
    return http.Response(
      json.encode({'message': 'Error: $error', 'status': 'error'}),
      400,
    );
  }
}
