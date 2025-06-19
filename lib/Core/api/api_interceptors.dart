import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:gradution_project/Core/api/endPointes.dart';
import 'package:gradution_project/Core/hive_constants/hive_constants.dart';


class ApiInterceptor extends Interceptor {
  static final Box box = Hive.box(HiveConstants.Boxname);
  // send header with request
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers['accept_ language'] = "en";
    options.headers['Authorization'] =
        box.get(ApiKey.token, defaultValue: "") != null
            ? "Bearer ${box.get(ApiKey.token, defaultValue: "")}"
            : null;
  //  options.headers['Content-Type'] = "application/x-www-form-urlencoded";
  options.headers['Content-Type'] = "application/json";
  

    // final token =  box.get(ApiKey.token, defaultValue: "");
   
    // if (token != null) {
    //   options.headers['Authorization'] = "Bearer $token";
    // }
     super.onRequest(options, handler);
   }

  // 'Authorization': 'Bearer $token',
}
