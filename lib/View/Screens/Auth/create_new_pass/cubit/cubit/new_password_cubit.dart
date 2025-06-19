import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/repo/AuthRepo.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit(this.userrepo) : super(NewPasswordInitial());

  final AuthRepo userrepo;
  String email = AuthRepo.box.get('email');
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void validatePasswords() {
    if (pass.text != confirmPass.text) {
      _errorMessage = 'Passwords do not match';
      emit(NewPasswordMisMatch(message:  _errorMessage!)); // Emit the state with the error
    } else {
      _errorMessage = null; // Clear error if passwords match
      emit(NewPasswordInitial()); // Reset state if passwords match
    }
  }

  CreatNewPass() async {
    emit(NewPasswordLoading());

    final response =
        await userrepo.createNewPassword(email: email, pass: pass.text);
    response.fold((erromessage) {
      emit(NewPasswordFail());
    }, (GlobalResponse) {
      emit(NewPasswordSuccess());
    });
  }


  @override
  Future<void> close() {
    // Dispose of the controllers when the cubit is closed
    pass.dispose();
    confirmPass.dispose();
    return super.close();
  }
}
