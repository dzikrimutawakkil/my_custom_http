import 'package:http/http.dart' as http;

import 'method_strategy/delete_strategy.dart';
import 'method_strategy/get_strategy.dart';
import 'method_strategy/patch_strategy.dart';
import 'method_strategy/post_strategy.dart';
import 'method_strategy/put_strategy.dart';

abstract class ReqMethod {
  Future<http.Response> execute(String url, Map<String, String> headers,
      {Map<String, dynamic>? body});

  static final ReqMethod getMethod = GetRequestStrategy();
  static final ReqMethod deleteMethod = DeleteRequestStrategy();
  static final ReqMethod patchMethod = PatchRequestStrategy();
  static final ReqMethod postMethod = PostRequestStrategy();
  static final ReqMethod putMethod = PutRequestStrategy();
}
