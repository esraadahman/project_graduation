import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
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
    }, (SignUpModel) {
      emit(SignUpSuccess(message: SignUpModel.message));
    });
  }

}
