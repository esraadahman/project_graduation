import 'package:project_graduation/ModelView/Group/SingleGroupModel.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/ModelView/Sign_UP/SignUpModel.dart';

part 'work_space_state.dart';

class WorkSpaceCubit extends Cubit<WorkSpaceState> {
  WorkSpaceCubit(this.userrepo) : super(WorkSpaceInitial());

  final Userrepo userrepo;
  Future<void> getGroupById(int id) async {
    emit(WorkSpaceLoading());
    final response = await userrepo.getGroupByID(id);

    response.fold(
      (errorMessage) {
        emit(WorkSpaceFailed());
      },
      (globalResponse) {
        emit(WorkSpaceSuccess(groupDetails: globalResponse));
      },
    );
  }

  Future<void> deleteGroup(int id) async {
    emit(DeleteWorkSpaceLoading());
    final response = await userrepo.deleteGroup(id);

    response.fold(
      (errorMessage) {
        emit(DeleteWorkSpaceFailed());
      },
      (globalResponse) {
        emit(DeleteWorkSpaceSuccess());
      },
    );
  }
}
