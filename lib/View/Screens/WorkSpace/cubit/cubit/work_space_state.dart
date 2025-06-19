part of 'work_space_cubit.dart';

@immutable
sealed class WorkSpaceState {}

final class WorkSpaceInitial extends WorkSpaceState {}

// final class WorkSpaceSuccess extends WorkSpaceState {
//   final SingleGroupModel groupDetails;

//   WorkSpaceSuccess({required this.groupDetails});
// }
class WorkSpaceSuccess extends WorkSpaceState {
  final SingleGroupModel groupDetails;
  final AllTasks TasksDetails;

  WorkSpaceSuccess({
    required this.groupDetails,
    required this.TasksDetails,
  });
}
final class WorkSpaceLoading extends WorkSpaceState {}

final class WorkSpaceFailed extends WorkSpaceState {}
//********************************** */
final class GetTasksSuccess extends WorkSpaceState {
    final AllTasks TasksDetails;
  GetTasksSuccess({required this.TasksDetails});

}

final class GetTasksLoading extends WorkSpaceState {}

final class GetTasksFailed extends WorkSpaceState {}
//********************************** */

final class DeleteWorkSpaceSuccess extends WorkSpaceState {}

final class DeleteWorkSpaceFailed extends WorkSpaceState {
  String message;
  DeleteWorkSpaceFailed({required this.message});
}

final class DeleteWorkSpaceLoading extends WorkSpaceState {}
