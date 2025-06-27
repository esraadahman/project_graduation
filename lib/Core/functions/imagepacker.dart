import 'package:gradution_project/Core/Imports/common_imports.dart';

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
