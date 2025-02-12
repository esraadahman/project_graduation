import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:path/path.dart' as path;
part 'work_spaces_state.dart';

class WorkSpacesCubit extends Cubit<WorkSpacesState> {
  WorkSpacesCubit(this.userrepo) : super(WorkSpacesInitial());
  final Userrepo userrepo;

  Future<void> getAllGroups() async {
    emit(WorkSpacesLoading());
    final response = await userrepo.getAllGroups();

    response.fold(
      (errorMessage) {
        emit(WorkSpacesFailed());
      },
      (globalResponse) {
        emit(WorkSpacesSuccess(response: globalResponse));
      },
    );
  }

  String user_image = "";
  String filename = "";

  getname_of_image(String fullPath) {
    // Extract the basename from the full path
    filename = path.basename(fullPath);
    print(filename);
  }

  void sortGroupsByDate(List<GroupData> groups) {
    groups.sort((a, b) {
      DateTime dateA = DateTime.parse(a.group.createdAt);
      DateTime dateB = DateTime.parse(b.group.createdAt);
      return dateB.compareTo(dateA); // Sorting from latest to oldest
    });
    emit(WorkSpacesSuccess(
        response: AllGroups(
      status: true,
      data: groups,
      numberOfGroups: groups.length,
    )));
  }

  void sortGroupsByName(List<GroupData> groups) {
    List<GroupData> sortedGroups = List.from(groups);
    sortedGroups.sort((a, b) {
      return a.group.title.toLowerCase().compareTo(b.group.title.toLowerCase());
    });
    print(sortedGroups);
    emit(WorkSpacesSuccess(
      response: AllGroups(
        status: true,
        data: sortedGroups,
        numberOfGroups: sortedGroups.length,
      ),
    ));
  }
}
