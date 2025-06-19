

import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
