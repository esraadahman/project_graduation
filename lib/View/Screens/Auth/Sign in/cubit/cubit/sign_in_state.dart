part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInSuccess extends SignInState {}

final class SignInloading extends SignInState {}

final class SignInfailer extends SignInState {
  final String errorMessage;

  SignInfailer({required this.errorMessage});
}