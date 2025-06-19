import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/Core/errors/regesrtrationerror.dart';
import 'package:gradution_project/repo/AuthRepo.dart';

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
      emit(SignUpSuccess(message: "Sign Up Success"));
    });
  }

  void signUpWithGoogle(BuildContext context) async {
    emit(SignUPWithGoogleLoading());

    final response = await auth.signUpWithGoogle(context);
    response.fold((errormessage) {
      emit(SignUPWithGoogleFailed());
    }, (Error) {
      emit(SignUPWithGoogleSuccess());
    });
  }

  void SignUpWithFaceBook() async {
    emit(SignUPWithFaceBookLoading());
    final response = await auth.signUpWithFacebook();
    response.fold((errormessage) {
      emit(SignUPWithFaceBookFailed());
    }, (Error) {
      emit(SignUPWithFaceBookSuccess());
    });
  }

  void SignUpWithGitHub() async {
    emit(SignUPWithGitHubLoading());
    final response = await auth.signUpWithGitHub();
    response.fold((errormessage) {
      emit(SignUPWithGitHubFailed());
    }, (Error) {
      emit(SignUPWithGitHubSuccess());
    });
  }
}
