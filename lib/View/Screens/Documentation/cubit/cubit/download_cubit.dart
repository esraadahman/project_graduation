import 'package:bloc/bloc.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:meta/meta.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit(this.userrepo) : super(DownloadInitial());
  final Userrepo userrepo;

    Future<void> fetchDownloadLink(int groupId) async {
    emit(DownloadLoading());

    final result1 = await userrepo.DownloadDoc1(groupid: groupId);

    result1.fold(
      (error) => emit(DownloadError(error)),
      (doc1) async {
        final result2 = await userrepo.downloadDoc2(doc1.tasks);

        result2.fold(
          (error) => emit(DownloadError(error)),
          (doc2) => emit(DownloadSuccess(doc2.downloadUrl)),
        );
      },
    );
  }
}

