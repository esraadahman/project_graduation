part of 'add_task_cubit_cubit.dart';

@immutable
// sealed class AddTaskCubitState {}

// final class AddTaskCubitInitial extends AddTaskCubitState {}

// final class AddTaskLoading extends AddTaskCubitState {}

// final class AddTaskSuccess extends AddTaskCubitState {}

// final class AddTaskFail extends AddTaskCubitState {}

// final class getMembersLoading extends AddTaskCubitState {}

// final class getMembersSuccess extends AddTaskCubitState {
//   final GroupMembers members;

//   getMembersSuccess({required this.members});

// }

// final class getMembersFail extends AddTaskCubitState {}
@immutable
sealed class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

// Once members are loaded, we’ll emit this, so the UI can show the assignee list:
class MembersLoaded extends AddTaskState {
  final GroupMembers members;
  MembersLoaded({required this.members});
}

class Membersloading extends AddTaskState {}

class getMembersFail extends AddTaskState {}

// While we’re in the middle of *adding* the task:
class TaskSubmitting extends AddTaskState {}

// On success of the add‐task API:
class TaskSuccess extends AddTaskState {}

// On *any* failure (either members or add‐task):
class TaskFailure extends AddTaskState {
  final String message;
  TaskFailure({required this.message});
}

class TaskUpdatingLoading extends AddTaskState {}

// On success of the add‐task API:
class TaskUpdateSuccess extends AddTaskState {}

// On *any* failure (either members or add‐task):
class TaskUpdateFailure extends AddTaskState {}
