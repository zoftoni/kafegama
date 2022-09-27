import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey("requirestoken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");
      String token = await SessionManager().get("TOKEN");
      options.headers.addAll({"Authorization": "Bearer $token"});
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // print(err);
    return handler.next(err);
  }
}
