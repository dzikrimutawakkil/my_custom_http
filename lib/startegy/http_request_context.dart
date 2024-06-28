import 'package:http/http.dart' as http;

import 'http_request_strategy.dart';

class HttpRequestContext {
  final ReqMethod strategy;

  HttpRequestContext(this.strategy);

  Future<http.Response> execute(String url, Map<String, String> headers,
      {Map<String, dynamic>? body}) {
    return strategy.execute(url, headers, body: body);
  }
}
