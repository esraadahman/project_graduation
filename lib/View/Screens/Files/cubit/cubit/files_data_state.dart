part of 'files_data_cubit.dart';

@immutable
sealed class FilesDataState {}

final class FilesDataInitial extends FilesDataState {}

final class WorkSpacesLoading2 extends FilesDataState {}

final class WorkSpacesSuccess2 extends FilesDataState {
  final AllGroups response;

  WorkSpacesSuccess2({required this.response});
}

final class WorkSpacesFail2 extends FilesDataState {}