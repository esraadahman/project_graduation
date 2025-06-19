import 'package:bloc/bloc.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/ModelView/GroupMembers/GroupMembers.dart';
import 'package:meta/meta.dart';

part 'add_task_cubit_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.userrepo) : super(AddTaskInitial());

  final Userrepo userrepo;

  Future<void> createNewWorkspace({
    required String title,
    required String des,
    required String urgencyLevel,
    required int assignedMember,
    required String deadline,
    required int group_id,
  }) async {
    emit(AddTaskLoading());

    final response = await userrepo.AddTask(
      title: title,
      des: des,
      assigned_to: assignedMember,
      deadline_date: deadline,
      group_id: group_id,
      Urgency: urgencyLevel,
    );

    response.fold(
      (errorMessage) {
        emit(TaskFailure(message: errorMessage));
      },
      (globalResponse) {
        emit(TaskSuccess());
      },
    );
  }

  Future<void> getGroupMember(int id) async {
    emit(Membersloading());
    final response = await userrepo.getMembers(id);

    response.fold(
      (errorMessage) {
        emit(getMembersFail());
      },
      (globalResponse) {
        emit(MembersLoaded(
          members: globalResponse,
        ));
      },
    );
  }

  Future<void> getTaskData(int id) async {
    emit(Membersloading());
    final response = await userrepo.getMembers(id);

    response.fold(
      (errorMessage) {
        emit(getMembersFail());
      },
      (globalResponse) {
        emit(MembersLoaded(
          members: globalResponse,
        ));
      },
    );
  }

  Future<void> UpdateTask({
    required String title,
    required String des,
    required String urgencyLevel,
    required int assignedMember,
    required String deadline,
    required int group_id,
    required int idtask,
  }) async {
    emit(TaskUpdatingLoading());
    final response = await userrepo.UpdateTaskFunction(
        title: title,
        des: des,
        assigned_to: assignedMember,
        deadline_date: deadline,
        group_id: group_id,
        Urgency: urgencyLevel,
        idtask: idtask);

    response.fold(
      (errorMessage) {
        emit(TaskUpdateFailure());
      },
      (globalResponse) {
        emit(TaskUpdateSuccess());
      },
    );
  }
}
