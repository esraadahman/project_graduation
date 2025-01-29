import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:project_graduation/Core/hive_constants/hive_constants.dart';
import 'package:project_graduation/ModelView/forgetPassword/forgetPassword.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

part 'otp_code_state.dart';

class OtpCodeCubit extends Cubit<OtpCodeState> {
  OtpCodeCubit(this.userrepo) : super(OtpCodeInitial());

  final AuthRepo userrepo;
  String email = AuthRepo.box.get('email');
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();

  forgetPasswordModel? user;



  late final List<TextEditingController> listControllers = [
    code1,
    code2,
    code3,
    code4,
  ];

  CheckOtpCode() async {
    emit(OtpCodeLoading());
    late String otpCode = code1.text + code2.text + code3.text + code4.text;
    print(otpCode);
    final response =
        await userrepo.checkOTPCode(email: email, otpCode: otpCode);
    response.fold((erromessage) {
      emit(OtpCodeFail());
    }, (forgetPasswordModel) {
      if (forgetPasswordModel.status == true) {
        emit(OtpCodeSuccess());
      } else {
        emit(OtpCodeFail());
      }
    });
  }

   resendEmail() async {
    emit(ResendEmailloading());
    final response = await userrepo.forgetPassword(email: email);
    response.fold((erromessage) {
      emit(ResendEmailFail());
    }, (forgetPasswordModel) {
      emit(ResendEmailSuccess());
    });
  }
}
