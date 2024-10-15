import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_graduation/Core/api/endPointes.dart';
import 'package:project_graduation/Core/errors/regesrtrationerror.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.auth) : super(SignUpInitial());


   TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final AuthRepo auth;

  signUp() async {
    

    emit(SignUpLoading());

      final response = await auth.sign_up(
        email: emailController.text,
        pass: passController.text,
        name: fullNameController.text,
       
      );

     response.fold((errormessage) {
      emit(SignUpFailure(errMessage: errormessage));
    }, (GlobalResponse) {
      emit(SignUpSuccess(message: GlobalResponse.message));
    });
  }

void signUpWithGoogle() async{
    emit(SignUPWithGoogleLoading());
    
      final response = await  auth.signUpWithGoogle();
    response.fold((errormessage) {
      emit(SignUPWithGoogleFailed());
    }, (Error) {
      emit(SignUPWithGoogleSuccess());
    });

  }
void SignUpWithFaceBook() async{
  emit(SignUPWithFaceBookLoading());
   final response = await  auth.signUpWithFacebook();
    response.fold((errormessage) {
      emit(SignUPWithFaceBookFailed());
    }, (Error) {
      emit(SignUPWithFaceBookSuccess());
    });
}
 void SignUpWithGitHub() async {
 emit(SignUPWithGitHubLoading());
   final response = await  auth.signUpWithGitHub();
    response.fold((errormessage) {
      emit(SignUPWithGitHubFailed());
    }, (Error) {
      emit(SignUPWithGitHubSuccess());
    });
 }
}
