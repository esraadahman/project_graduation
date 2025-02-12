part of 'work_spaces_cubit.dart';

@immutable
sealed class WorkSpacesState {}

final class WorkSpacesInitial extends WorkSpacesState {}
final class WorkSpacesLoading extends WorkSpacesState {}
final class WorkSpacesSuccess extends WorkSpacesState {
  final AllGroups response;

  WorkSpacesSuccess({required this.response});

}
final class WorkSpacesFailed extends WorkSpacesState {}

final class WorkSpaceSortSuccess extends WorkSpacesState {
  final GroupData response2;

  WorkSpaceSortSuccess({required this.response2});

  

}
