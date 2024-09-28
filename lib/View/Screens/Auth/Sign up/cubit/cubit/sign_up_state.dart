part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}
class SignUpFailure extends  SignUpState{
  final String? errMessage;
  final RequiredFieldsErrorModel? errorModel;

  SignUpFailure({this.errMessage, this.errorModel});
}
