part of 'forget_pass_email_cubit.dart';

@immutable
sealed class ForgetPassEmailState {}

final class ForgetPassEmailInitial extends ForgetPassEmailState {}
final class ForgetPassEmailLoading extends ForgetPassEmailState {}
final class ForgetPassEmailSuccess extends ForgetPassEmailState {}
final class ForgetPassEmailFail extends ForgetPassEmailState {}