import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class StageScreen extends StatelessWidget {
  const StageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _deadlineController = TextEditingController();

    Future<void> _pickFiles() async {
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

    return Scaffold(
        backgroundColor: ColorsClass.background,
        appBar: HeaderTitle(
          title: "Add New Work Space",
          onMorePressed: () {},
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          size.height(height(context) * .05),
          SizedBox(
            width: width(context),
            height: height(context) * .17,
            child: const ProgressBarWidget(
              activeIndex: 1,
            ),
          ),
          Radiobutton(
            onStageSelected: (String stage) {
              print(stage);
              // cubit.whatHeChoose = stage;
            },
          ),
          size.height(10),
          Padding(
            padding: EdgeInsets.only(
              left: width(context) * .03,
            ),
            child: const GradientCheckBoxWidget(
                text:
                    'Use AI Suggestions to guide you throw work\n space creation'),
          ),
          size.height(40),
          MediaScreen(
            ontap1: _pickFiles,
          ),
          size.height(40),
          DeadlineInput(controller: _deadlineController),
          size.height(40),
          Confirmbutton(
              text: "Next",
              onTap: () {
                context.navigateTo(TemplatesScreen());
              }),
          size.height(20),
          Confirmbuttonprimary(
              text: "Back",
              onTap: () {
                //  context.navigateTo(StageScreen()
                //   );
              }),
          size.height(40),
        ])));
  }
}
