part of 'switch_lang_cubit.dart';

@immutable
sealed class SwitchLangState {}

final class SwitchLangInitial extends SwitchLangState {}
class AppChangeLanguage extends SwitchLangState {
  final String languageCode;

  AppChangeLanguage({required this.languageCode});
}