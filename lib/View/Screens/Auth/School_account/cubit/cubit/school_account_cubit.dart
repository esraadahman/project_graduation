import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project_graduation/Core/errors/regesrtrationerror.dart';
import 'package:project_graduation/ModelView/Sign_UP/SignUpModel.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

part 'school_account_state.dart';

class SchoolAccountCubit extends Cubit<SchoolAccountState> {
  SchoolAccountCubit(this.auth) : super(SchoolAccountInitial());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final AuthRepo auth;

  void SignUpWith_SchoolAccount() async {
    emit(SchoolAccountLoading());
    final response = await auth.schoolSignUp(
        email: emailController.text,
        pass: passController.text,
        name: fullNameController.text,
        phone: phoneController.text);
    response.fold((errormessage) {
      emit(SchoolAccountFail(
        errMessage: errormessage,
      ));
    }, (GlobalResponse) {
      emit(SchoolAccountSccess(message: GlobalResponse.message));
    });
  }
}
