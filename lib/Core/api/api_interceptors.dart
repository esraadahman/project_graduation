import 'package:dio/dio.dart';
import 'package:project_graduation/Core/api/endPointes.dart';


class ApiInterceptor extends Interceptor {
  // send header with request
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers['accept_ language'] = "en";
    // options.headers['Authorization'] =
    //     CacheHelper().getData(key: ApiKey.token) != null
    //         ? "${CacheHelper().getData(key: ApiKey.token)}"
    //         : null;
    options.headers['Content-Type'] = "application/x-www-form-urlencoded";

    // final token = CacheHelper().getData(key: ApiKey.token);
    // if (token != null) {
    //   options.headers['Authorization'] = "Bearer $token";
    // }
     super.onRequest(options, handler);
   }

  // 'Authorization': 'Bearer $token',
}
