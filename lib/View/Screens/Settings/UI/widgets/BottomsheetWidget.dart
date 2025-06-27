import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:image_picker/image_picker.dart';

class BottomsheetWidget extends StatelessWidget {
  const BottomsheetWidget({
    super.key,
    required this.onImageSelected,
    required this.onImageTaked,
  });

  final Function(XFile image) onImageSelected;
  final Function(XFile image) onImageTaked;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt, color: ColorsClass.primary),
            title: Text(
              "Take a photo",
              style: styling.maintitle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorsClass.primary,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.camera);
              if (pickedFile != null) {
                onImageTaked(pickedFile);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library, color: ColorsClass.primary),
            title: Text(
              "Choose from gallery",
              style: styling.maintitle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: ColorsClass.primary,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                onImageSelected(pickedFile);
              }
            },
          ),
        ],
      ),
    );
  }
}
