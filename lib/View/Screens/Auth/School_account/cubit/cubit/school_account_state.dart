part of 'school_account_cubit.dart';

@immutable
sealed class SchoolAccountState {}

final class SchoolAccountInitial extends SchoolAccountState {}

final class SchoolAccountLoading extends SchoolAccountState {}

final class SchoolAccountSccess extends SchoolAccountState {
  final String message;

  SchoolAccountSccess({required this.message});
}

final class SchoolAccountFail extends SchoolAccountState {
  final String? errMessage;
  final RequiredFieldsErrorModel? errorModel;

  SchoolAccountFail({this.errMessage, this.errorModel});
}
