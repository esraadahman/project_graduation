import 'package:bloc/bloc.dart';
import 'package:gradution_project/ModelView/ChallengesModel/GetChallenges.dart';
import 'package:gradution_project/repo/UserRepo.dart';
import 'package:meta/meta.dart';

part 'task_cubit_state.dart';

class TaskCubitCubit extends Cubit<TaskCubitState> {
  TaskCubitCubit(this.userrepo) : super(TaskCubitInitial());
  final Userrepo userrepo;

  Future<void> deleteGroup(int group_id, int taskid) async {
    emit(TaskCubitDeleteLoading());
    final response = await userrepo.deleteTask(group_id, taskid);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(TaskCubitDeleteFail());
      },
      (globalResponse) {
        print("success");
        emit(TaskCubitDeleteSuccess());
      },
    );
  }

  Future<void> UpdateTaskStatus(int group_id, int taskid, String status) async {
    emit(TaskCubitStatusLoading());
    final response = await userrepo.updateTaskStatus(
        group_id: group_id, taskId: taskid, status: status);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(TaskCubitStatusFail());
      },
      (globalResponse) {
        print("success");
        emit(TaskCubitStatusSuccess());
      },
    );
  }

  Future<void> getTaskChallanges(int taskId) async {
    emit(ChallangesCubitStatusLoading());

    final response = await userrepo.getTaskChallanges(taskId);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(ChallangesCubitStatusFail());
      },
      (globalResponse) {
        print("success");
        emit(ChallangesCubitStatusSuccess(challenges: globalResponse));
      },
    );
  }

  Future<void> deleteChallange(int idChallange) async {
    emit(ChallangeDeleteLoading());
    final response = await userrepo.deleteChallange(idChallange);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(ChallangeDeleteFail());
      },
      (globalResponse) {
        print("success");
        emit(ChallangeDeleteSuccess());
      },
    );
  }

  void resetToInitial() {
    emit(TaskCubitInitial());
  }
}
