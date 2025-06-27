import 'package:bloc/bloc.dart';
import 'package:gradution_project/ModelView/AllGroups/AllGroups.dart';
import 'package:gradution_project/repo/UserRepo.dart';
import 'package:meta/meta.dart';

part 'files_data_state.dart';

class FilesDataCubit extends Cubit<FilesDataState> {
  FilesDataCubit(this.userrepo) : super(FilesDataInitial());
  final Userrepo userrepo;

  Future<void> getAllGroups() async {
    emit(WorkSpacesLoading2());
    final response = await userrepo.getAllGroups();

    response.fold(
      (errorMessage) {
        emit(WorkSpacesFail2());
      },
      (globalResponse) {
        emit(WorkSpacesSuccess2(response: globalResponse));
      },
    );
  }
}
