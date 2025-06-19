import 'dart:io';
import 'package:gradution_project/Core/Imports/common_imports.dart';
part 'add_workspace_state.dart';

class AddWorkspaceCubit extends Cubit<AddWorkspaceState> {
  AddWorkspaceCubit(this.userrepo) : super(AddWorkspaceInitial());

  final Userrepo userrepo;

  TextEditingController workSpaceName = TextEditingController();
  TextEditingController workSpaceDescription = TextEditingController();
  TextEditingController workSpaceStage = TextEditingController();
  TextEditingController workSpaceDeadline = TextEditingController();

  DateTime? selectedDate;

  static const String workspaceBox = 'workspaceBox';
  static const String workspaceNameKey = 'workspaceName';
  static const String workspaceDescriptionKey = 'workspaceDescription';
  // String name="" ;
  // String des="";

  /// Save Workspace Data to Hive
  Future<void> saveWorkspaceData(String name, String description) async {
    if (name.isNotEmpty && description.isNotEmpty) {
      final box = Hive.box(workspaceBox);
      await box.put(workspaceNameKey, name);
      await box.put(workspaceDescriptionKey, description);
      emit(AssignSuccess());
    } else {
      emit(AssignFailed());
    }
  }

  Future<Map<String, String>> getWorkspaceData() async {
    final box = Hive.box(workspaceBox);
    final name = box.get(workspaceNameKey, defaultValue: "");
    final description = box.get(workspaceDescriptionKey, defaultValue: "");
    return {"name": name, "description": description};
  }

  Future<void> createNewWorkspace() async {
    final workspaceData = await getWorkspaceData();
    final name = workspaceData["name"] ?? "";
    final des = workspaceData["description"] ?? "";

    print(
        " name :$name , description :$des , stage: ${workSpaceStage.text} , deadline :${workSpaceDeadline.text}");
    if (name.isEmpty || des.isEmpty) {
      emit(AddWorkspaceFailed());
      return;
    }

    emit(AddWorkspeLoading());

    final response = await userrepo.AddWorkSpace(
      deadline: workSpaceDeadline.text,
      title: name,
      des: des,
      stage: workSpaceStage.text,
    );

    response.fold(
      (errorMessage) {
        emit(AddWorkspaceFailed());
      },
      (globalResponse) {
        emit(AddWorkspaceSuccess());
      },
    );
  }

  // Refactored _selectDate function
  Future<void> selectDate(BuildContext context) async {
    DateTime initialDate = selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      workSpaceDeadline.text = "${picked.toLocal()}".split(' ')[0];

      // Emit a new state to reflect the updated date
      emit(AddWorkspaceDateSelected(picked));
    }
  }

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType
          .custom, // Use custom type for filtering specific file extensions
      allowedExtensions: ['jpg', 'png', 'pdf'], // Specify allowed file types
    );

    if (result != null) {
      // Handle multiple picked files
      List<File> files = result.paths.map((path) => File(path!)).toList();
      print('Picked files:');
      for (var file in files) {
        print(file.path); // Handle each file
      }
    } else {
      // User canceled the picker
      print('No files picked');
    }
  }
}
