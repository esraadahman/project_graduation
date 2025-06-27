import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';


part 'settingscubit_state.dart';

class SettingscubitCubit extends Cubit<SettingscubitState> {
  SettingscubitCubit(this.userrepo) : super(SettingscubitInitial());

  final Userrepo userrepo;

  static final Box box = Hive.box(HiveConstants.Boxname);
  String get name => box.get(ApiKey.name, defaultValue: "User") as String;
  String get email => box.get(ApiKey.email, defaultValue: "email") as String;
  String get pass =>
      box.get(ApiKey.password, defaultValue: "password") as String;
  String get id => box.get(ApiKey.id, defaultValue: "") as String;

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    final response = await userrepo.getUserData();

    response.fold(
      (errorMessage) {
        emit(GetUserDataFail());
      },
      (globalResponse) {
        emit(GetUserDataSucces(userdata: globalResponse.user));
      },
    );
  }

  Future<void> deleteAccount(String pass) async {
    emit(DeleteAccountLoading());

    final response = await userrepo.DeleteAcount(pass);
    response.fold((errorMessage) {
      emit(DeleteAccountFail(message: errorMessage));
    }, (GlobalResponse) {
      emit(DeleteAccountSucces());
    });
  }

  Future<void> uploadProfileImage(XFile file) async {
    emit(UploadImageLoading());

    final result = await userrepo.uploadAvatar(File(file.path));

    result.fold(
      (error) => emit(UploadImageFail(message: error)),
      (message) => emit(UploadImageSucces(userdata: message.user)),
    );
  }

  Future<void> UpdateUserData(
      {required String name,
      required String email,
      required String phone,
      required String bio}) async {
    emit(UpdateUserLoading());

    final result = await userrepo.updateUserData(
        name: name, email: email, phone: phone, bio: bio);

    result.fold(
      (error) => emit(UpdateUserFail(message: error)),
      (message) => emit(UpdateUserSucces()),
    );
  }

  String formatAvatarUrl(String avatarPath) {
    if (avatarPath.startsWith('http'))
      return avatarPath.replaceFirst('/avatars/', '/api/storage/avatars/');

    return "https://bridge-it-backend-main-tfxagd.laravel.cloud/api/storage/" +
        avatarPath.replaceFirst('avatars/', 'avatars/');
  }
}
