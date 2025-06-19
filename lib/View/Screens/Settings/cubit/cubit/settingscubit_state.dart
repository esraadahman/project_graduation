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

