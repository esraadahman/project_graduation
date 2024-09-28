import 'package:dartz/dartz.dart';
import 'package:project_graduation/Core/api/api_consumer.dart';
import 'package:project_graduation/Core/api/endPointes.dart';
import 'package:project_graduation/Core/errors/exceptions.dart';
import 'package:project_graduation/ModelView/LoginModel/LoginModel.dart';
import 'package:project_graduation/ModelView/Sign_UP/SignUpModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  Future<Either<String, LoginModel>> sign_in(
      {required String email, required String pass}) async {
    try {
      final response = await api.post(EndPoint.signin,
          data: {ApiKey.email: email, ApiKey.password: pass}, isFromData: true);
      final user = LoginModel.fromJson(response);


      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SignUpModel>> sign_up({
    required String email,
    required String pass,
    required String name,
  }) async {
    try {
      final response = await api.post(EndPoint.signup, isFromData: true, data: {
        ApiKey.name: name,
       
        ApiKey.email: email,
        ApiKey.password: pass,


      });
      final user = SignUpModel.fromJson(response);
      // Save user data using SharedPreferences

    
     
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  // Future<Either<String, LogoutModel>> logout() async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.logout,
  //     );
  //     CacheHelper().removeData(key: ApiKey.token);
  //     CacheHelper().removeData(key: ApiKey.id);
  //     CacheHelper().removeData(key: ApiKey.email);
  //     CacheHelper().removeData(key: ApiKey.first_name);
  //     CacheHelper().removeData(key: ApiKey.image);
  //     CacheHelper().removeData(key: ApiKey.last_name);
  //     final response2 = LogoutModel.fromJson(response);

  //     return Right(response2);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.message);
  //   }
  // }
}