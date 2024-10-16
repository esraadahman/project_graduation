import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_graduation/ModelView/LoginModel/LoginModel.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.userrepo) : super(SignInInitial());

   final AuthRepo userrepo;

  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  LoginModel? user;

  signin() async {
    emit(SignInloading());
    final response = await userrepo.sign_in(
        email: emailController.text, pass: passwordController.text);
    response.fold((erromessage) {
      emit(SignInfailer(errorMessage: erromessage));
    }, (LoginModel) {
      emit(SignInSuccess());
    });
  }
  void signUpWithGoogle() async{
    emit(SignUPWithGoogleLoading());
    
      final response = await  userrepo.signUpWithGoogle();
    response.fold((errormessage) {
      emit(SignUPWithGoogleFailed());
    }, (Error) {
      emit(SignUPWithGoogleSuccess());
    });

  }
void SignUpWithFaceBook() async{
  emit(SignUPWithFaceBookLoading());
   final response = await  userrepo.signUpWithFacebook();
    response.fold((errormessage) {
      emit(SignUPWithFaceBookFailed());
    }, (Error) {
      emit(SignUPWithFaceBookSuccess());
    });
}
 void SignUpWithGitHub() async {
 emit(SignUPWithGitHubLoading());
   final response = await  userrepo.signUpWithGitHub();
    response.fold((errormessage) {
      emit(SignUPWithGitHubFailed());
    }, (Error) {
      emit(SignUPWithGitHubSuccess());
    });
 }
}
