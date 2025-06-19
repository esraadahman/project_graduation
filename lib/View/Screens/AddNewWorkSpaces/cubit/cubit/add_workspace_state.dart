part of 'add_workspace_cubit.dart';

@immutable
abstract class AddWorkspaceState {}

class AddWorkspaceInitial extends AddWorkspaceState {}

class AddWorkspeLoading extends AddWorkspaceState {}

class AddWorkspaceFailed extends AddWorkspaceState {}

class AddWorkspaceSuccess extends AddWorkspaceState {}
class AssignSuccess extends AddWorkspaceState {}
class AssignFailed extends AddWorkspaceState {}

// New state to handle date selection
class AddWorkspaceDateSelected extends AddWorkspaceState {
  final DateTime selectedDate;

  AddWorkspaceDateSelected(this.selectedDate);
}
class WorkspaceDetailsUpdated extends AddWorkspaceState {
  final String name;
  final String description;
  final String stage;
  final String deadline;

  WorkspaceDetailsUpdated(
    this.name,
    this.description,
    this.stage,
    this.deadline,
  );
}


