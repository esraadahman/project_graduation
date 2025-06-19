import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/ModelView/forgetPassword/forgetPassword.dart';
import 'package:gradution_project/repo/AuthRepo.dart';

part 'forget_pass_email_state.dart';

class ForgetPassEmailCubit extends Cubit<ForgetPassEmailState> {
  ForgetPassEmailCubit(this.userrepo) : super(ForgetPassEmailInitial());

  final AuthRepo userrepo;

  TextEditingController emailController = TextEditingController();

  forgetPasswordModel? user;

  forgetPassword() async {
    emit(ForgetPassEmailLoading());
    final response = await userrepo.forgetPassword(email: emailController.text);
    response.fold((erromessage) {
      emit(ForgetPassEmailFail());
    }, (forgetPasswordModel) {
      emit(ForgetPassEmailSuccess());
    });
  }
}
