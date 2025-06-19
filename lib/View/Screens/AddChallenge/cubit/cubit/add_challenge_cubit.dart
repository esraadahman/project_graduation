import 'package:bloc/bloc.dart';
import 'package:gradution_project/repo/UserRepo.dart';
import 'package:meta/meta.dart';

part 'add_challenge_state.dart';

class AddChallengeCubit extends Cubit<AddChallengeState> {
  AddChallengeCubit(this.userrepo) : super(AddChallengeInitial());

  final Userrepo userrepo;
  Future<void> AddTaskChallange(
      {required String title, required String des, required int taskid}) async {
    emit(TaskCubitAddChallangeLoading());
    final response =
        await userrepo.AddTaskChallange(title: title, des: des, taskid: taskid);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(TaskCubitAddChallangeFail());
      },
      (globalResponse) {
        print("success");
        emit(TaskCubitAddChallangeSuccess());
      },
    );
  }

  Future<void> UpdateTaskChallange(
      {required String title,
      required String des,
      required int challengeid}) async {
    emit(TaskCubitupdateChallangeLoading());
    final response = await userrepo.updateChallange(
        title: title, des: des, challengeid: challengeid);

    response.fold(
      (errorMessage) {
        print("failed");
        emit(TaskCubitupdateChallangeFail());
      },
      (globalResponse) {
        print("success");
        emit(TaskCubitupdateChallangeSuccess());
      },
    );
  }
}
