import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_graduation/Core/api/api_consumer.dart';
import 'package:project_graduation/Core/api/endPointes.dart';
import 'package:project_graduation/Core/errors/exceptions.dart';
import 'package:project_graduation/Core/hive_constants/hive_constants.dart';
import 'package:project_graduation/ModelView/LoginModel/LoginModel.dart';
import 'package:project_graduation/ModelView/Sign_UP/SignUpModel.dart';
import 'package:project_graduation/ModelView/forgetPassword/forgetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  static final Box box = Hive.box(HiveConstants.Boxname);

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

  Future<Either<String, GlobalResponse>> sign_up({
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
      final user = GlobalResponse.fromJson(response);
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

  Future<Either<String, String>> signUpWithGoogle() async {
    try {
      final String url = EndPoint.baseUrl + EndPoint.google;

      // Check if the URL can be launched
      if (await canLaunch(url)) {
        // Use the older launch method
        await launch(url);

        return const Right("Launched URL in browser");
      } else {
        return const Left("Could not launch URL");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  

  Future<Either<String, String>> signUpWithGitHub() async {
    try {
      final String url = EndPoint.baseUrl + EndPoint.github;

      if (await canLaunch(url)) {
        await launch(url);
        return const Right("Launched GitHub in browser");
      } else {
        return const Left("Could not launch GitHub URL");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> signUpWithFacebook() async {
    try {
      final String url = EndPoint.baseUrl + EndPoint.linkedIn;

      if (await canLaunch(url)) {
        await launch(url);
        return const Right("Launched Facebook in browser");
      } else {
        return const Left("Could not launch Facebook URL");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GlobalResponse>> schoolSignUp(
      {required String email,
      required String pass,
      required String name,
      required String phone}) async {
    try {
      final response = await api.post(EndPoint.signup, isFromData: true, data: {
        ApiKey.name: name,
        ApiKey.email: email,
        ApiKey.password: pass,
        ApiKey.phone: phone,
        ApiKey.type: "school",
      });
      final user = GlobalResponse.fromJson(response);
      // Save user data using SharedPreferences

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, forgetPasswordModel>> forgetPassword({
    required String email,
  }) async {
    try {
      final response =
          await api.post(EndPoint.forgetPassword, isFromData: true, data: {
        ApiKey.email: email,
      });
      final user = forgetPasswordModel.fromJson(response);
      box.put('email', email);
      print(box.get('email'));
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, forgetPasswordModel>> checkOTPCode({
    required String email,
    required String otpCode,
  }) async {
    try {
      final response =
          await api.post(EndPoint.otpCode, isFromData: true, data: {
        ApiKey.email: email,
        ApiKey.token: otpCode,
      });
      final user = forgetPasswordModel.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse>> createNewPassword({
    required String email,
    required String pass,
  }) async {
    try {
      final response =
          await api.post(EndPoint.createNewPassword, isFromData: true, data: {
        ApiKey.email: email,
        ApiKey.password: pass,
      });
      final user = GlobalResponse.fromJson(response);
      // Save user data using SharedPreferences

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
