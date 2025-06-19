part of 'task_cubit_cubit.dart';

@immutable
sealed class TaskCubitState {}

final class TaskCubitInitial extends TaskCubitState {}

final class TaskCubitDeleteLoading extends TaskCubitState {}

final class TaskCubitDeleteSuccess extends TaskCubitState {}

final class TaskCubitDeleteFail extends TaskCubitState {}

final class TaskCubitStatusLoading extends TaskCubitState {}

final class TaskCubitStatusSuccess extends TaskCubitState {}

final class TaskCubitStatusFail extends TaskCubitState {}

/******************* */

final class ChallangeDeleteLoading extends TaskCubitState {}

final class ChallangeDeleteSuccess extends TaskCubitState {}

final class ChallangeDeleteFail extends TaskCubitState {}
/************************ */

final class ChallangesCubitStatusLoading extends TaskCubitState {}

final class ChallangesCubitStatusSuccess extends TaskCubitState {
  final Getchallenges challenges;
  ChallangesCubitStatusSuccess({required this.challenges});
}

final class ChallangesCubitStatusFail extends TaskCubitState {}
