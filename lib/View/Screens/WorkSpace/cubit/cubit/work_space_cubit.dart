import 'package:gradution_project/ModelView/AllTasks/AllTasks.dart';
import 'package:gradution_project/ModelView/Group/SingleGroupModel.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

part 'work_space_state.dart';

class WorkSpaceCubit extends Cubit<WorkSpaceState> {
  WorkSpaceCubit(this.userrepo) : super(WorkSpaceInitial());

  final Userrepo userrepo;
 
 
  SingleGroupModel? _groupDetails;
AllTasks? _tasksDetails;

Future<void> getAllData(int groupId) async {
  emit(WorkSpaceLoading());

  final groupResult = await userrepo.getGroupByID(groupId);
  final taskResult = await userrepo.getGroupTasks(groupId);

  groupResult.fold(
    (l) => emit(WorkSpaceFailed()),
    (groupData) => _groupDetails = groupData,
  );

  taskResult.fold(
    (l) => emit(WorkSpaceFailed()),
    (taskData) => _tasksDetails = taskData,
  );

  if (_groupDetails != null && _tasksDetails != null) {
    emit(WorkSpaceSuccess(
      groupDetails: _groupDetails!,
      TasksDetails: _tasksDetails!,
    ));
  }
}

  Future<void> deleteGroup(int id) async {
    emit(WorkSpaceLoading());
    final response = await userrepo.deleteGroup(id);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(DeleteWorkSpaceFailed(message: errorMessage));
      },
      (globalResponse) {
        print("success");
        emit(DeleteWorkSpaceSuccess());
      },
    );
  }
}
