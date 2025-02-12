part of 'work_space_cubit.dart';

@immutable
sealed class WorkSpaceState {}

final class WorkSpaceInitial extends WorkSpaceState {}

final class WorkSpaceSuccess extends WorkSpaceState {
  final SingleGroupModel groupDetails;

  WorkSpaceSuccess({required this.groupDetails});
}

final class WorkSpaceLoading extends WorkSpaceState {}

final class WorkSpaceFailed extends WorkSpaceState {}

final class DeleteWorkSpaceSuccess extends WorkSpaceState {

}

final class DeleteWorkSpaceLoading extends WorkSpaceState {}

final class DeleteWorkSpaceFailed extends WorkSpaceState {}