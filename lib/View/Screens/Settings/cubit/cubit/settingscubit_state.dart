part of 'settingscubit_cubit.dart';

@immutable
sealed class SettingscubitState {}

final class SettingscubitInitial extends SettingscubitState {}

final class SettingscubitLoading extends SettingscubitState {}

final class SettingscubitLoaded extends SettingscubitState {
  final String name;
  final String email;
  final String pass;

  SettingscubitLoaded(this.pass, {required this.name, required this.email});
}

final class SettingscubitError extends SettingscubitState {
  final String message;

  SettingscubitError({required this.message});
}

final class GetUserDataLoading extends SettingscubitState {}

final class GetUserDataSucces extends SettingscubitState {
  final Userdata userdata;

  GetUserDataSucces({required this.userdata});
}

final class GetUserDataFail extends SettingscubitState {}

final class DeleteAccountLoading extends SettingscubitState {}

final class DeleteAccountSucces extends SettingscubitState {}

final class DeleteAccountFail extends SettingscubitState {
  final String message;

  DeleteAccountFail({required this.message});
}

final class UploadImageLoading extends SettingscubitState {}

final class UploadImageSucces extends SettingscubitState {
   final User_Image_Upload userdata;

  UploadImageSucces({required this.userdata});

}

final class UploadImageFail extends SettingscubitState {
  final String message;

  UploadImageFail({required this.message});
}

final class UpdateUserLoading extends SettingscubitState {}

final class UpdateUserSucces extends SettingscubitState {}

final class UpdateUserFail extends SettingscubitState {
  final String message;

  UpdateUserFail({required this.message});
}
