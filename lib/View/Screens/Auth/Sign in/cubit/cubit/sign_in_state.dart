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


 class SignUPWithGoogleLoading extends SignInState{}
 class SignUPWithGoogleSuccess extends SignInState{}
  class SignUPWithGoogleFailed extends SignInState{}


 class SignUPWithGitHubLoading extends SignInState{}
 class SignUPWithGitHubSuccess extends SignInState{}
  class SignUPWithGitHubFailed extends SignInState{}

 class SignUPWithFaceBookLoading extends SignInState{}
 class SignUPWithFaceBookSuccess extends SignInState{}
  class SignUPWithFaceBookFailed extends SignInState{}