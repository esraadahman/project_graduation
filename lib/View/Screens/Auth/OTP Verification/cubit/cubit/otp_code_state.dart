part of 'otp_code_cubit.dart';

@immutable
sealed class OtpCodeState {}

final class OtpCodeInitial extends OtpCodeState {}

final class OtpCodeLoading extends OtpCodeState{}
final class OtpCodeSuccess extends OtpCodeState{}
final class OtpCodeFail extends OtpCodeState {}



final class ResendEmailloading extends OtpCodeState{}
final class ResendEmailSuccess extends OtpCodeState{}
final class ResendEmailFail extends OtpCodeState {}