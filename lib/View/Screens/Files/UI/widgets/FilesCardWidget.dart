import 'dart:io';

import 'package:gradution_project/Core/Imports/common_imports.dart';

class FileCard extends StatelessWidget {
  final FileCardData data;

  const FileCard({Key? key, required this.data}) : super(key: key);

  SvgPicture _getIconForType(String type) {
    switch (type) {
      case 'image':
        return SvgPicture.asset('assets/images/imageIcon.svg');
      case 'video':
        return SvgPicture.asset('assets/images/vedio.svg');
      case 'document':
        return SvgPicture.asset('assets/images/filesIcon.svg');
      default:
        return SvgPicture.asset('assets/images/filesIcon.svg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 300,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsClass.files)),
      child: Column(
        children: [
          // Icon Container
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: ColorsClass.files,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: _getIconForType(data.type),
            ),
          ),

          const SizedBox(height: 10),

          // File name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              data.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          const SizedBox(height: 4),

          // Uploaded Date (Placeholder)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat('yyyy-MM-dd').format(data.uploadedDate),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                )),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

enum FilesType { document, image, video }

class FileCardData {
  final String name;
  final File file;
  final String type;
  final DateTime uploadedDate;
  FileCardData({
    required this.name,
    required this.file,
    required this.type,
    required this.uploadedDate,
  });
}
