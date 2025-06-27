import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gradution_project/Core/api/api_consumer.dart';
import 'package:gradution_project/Core/api/endPointes.dart';
import 'package:gradution_project/Core/errors/exceptions.dart';
import 'package:gradution_project/Core/hive_constants/hive_constants.dart';
import 'package:gradution_project/ModelView/LoginModel/LoginModel.dart';
import 'package:gradution_project/ModelView/Sign_UP/SignUpModel.dart';
import 'package:gradution_project/ModelView/forgetPassword/forgetPassword.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  static final Box box = Hive.box(HiveConstants.Boxname);

  Future<Either<String, LoginModel>> sign_in(
      {required String email, required String pass}) async {
    try {
      String dToken = await box.get(ApiKey.d_token);
      print("token: $dToken");
      final response = await api.post(EndPoint.signIn,
          data: {
            ApiKey.email: email,
            ApiKey.password: pass,
            ApiKey.d_token: dToken
          },
          isFromData: true);
      final user = LoginModel.fromJson(response);
      await box.put(ApiKey.token, user.token.accessToken);
      await box.put(ApiKey.name, user.data.user.name);
      await box.put(ApiKey.email, user.data.user.email);
      await box.put(ApiKey.id, user.data.user.id);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Signupmodel>> sign_up({
    required String email,
    required String pass,
    required String name,
  }) async {
    try {
      String dToken = await box.get(ApiKey.d_token);
      final response = await api.post(EndPoint.signUp, isFromData: true, data: {
        ApiKey.name: name,
        ApiKey.email: email,
        ApiKey.password: pass,
        ApiKey.d_token: dToken
      });
      final user = Signupmodel.fromJson(response);
      // Save user data using SharedPreferences
      await box.put(ApiKey.token, user.token.accessToken);
      await box.put(ApiKey.name, user.user.name);
      await box.put(ApiKey.email, user.user.email);
      await box.put(ApiKey.password, pass);
      await box.put(ApiKey.id, user.user.id);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }



  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<User?> get authChanges => _auth.authStateChanges();
  static User get user => _auth.currentUser!;

  Future<Either<String, String>> signUpWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return const Left("Google sign-in was cancelled");
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo?.isNewUser ?? false) {
          print(
              "userName: ${user.displayName}\nuid: ${user.uid}\nprofilePhoto: ${user.photoURL}");
        }
        return const Right("Signed in with Google successfully");
      } else {
        return const Left("Google sign-in failed");
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Sign in failed')),
      );
      return Left(e.message ?? "Firebase Auth error");
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
      final response = await api.post(EndPoint.signUp, isFromData: true, data: {
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
