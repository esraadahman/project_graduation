import 'dart:io';

import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/Files/UI/widgets/FilesButton2.dart';
import 'package:gradution_project/View/Screens/Files/UI/widgets/FilesButtonWidget.dart';
import 'package:gradution_project/View/Screens/Files/UI/widgets/FilesCardWidget.dart';
import 'package:gradution_project/View/Screens/Home/UI/widget/AppBarWidget.dart';



class FilesScreen extends StatefulWidget {
  FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  final List<String> filters = ["All", "Docs", "Video", "images"];

  Future<void> pickAndAddFile(FileType fileType) async {
    final result = await FilePicker.platform.pickFiles(type: fileType);
    if (result != null && result.files.isNotEmpty) {
      final path = result.files.single.path!;
      final file = File(path);
      final name = result.files.single.name;
      String type = '';

      switch (fileType) {
        case FileType.image:
          type = 'image';
          break;
        case FileType.video:
          type = 'video';
          break;
        case FileType.any:
          type = 'document';
          break;
        default:
          type = 'document';
      }

      setState(() {
        uploadedFiles.add(FileCardData(
          name: name,
          file: file,
          type: type,
          uploadedDate: DateTime.now(),
        ));
      });
    }
  }

  String selectedFilter = "All";
  List<FileCardData> uploadedFiles = [];
  FilesType detectFileType(String path) {
    final ext = path.toLowerCase();
    if (ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif")) {
      return FilesType.image;
    } else if (ext.endsWith(".mp4") ||
        ext.endsWith(".mov") ||
        ext.endsWith(".avi")) {
      return FilesType.video;
    } else if (ext.endsWith(".pdf") ||
        ext.endsWith(".doc") ||
        ext.endsWith(".docx")) {
      return FilesType.document;
    }
    return FilesType.document; // Default fallback
  }

  // 1. Filter logic here
  List<FileCardData> get filteredFiles {
    if (selectedFilter == "All") {
      return uploadedFiles;
    } else if (selectedFilter == "Docs") {
      return uploadedFiles.where((file) => file.type == 'document').toList();
    } else if (selectedFilter == "Video") {
      return uploadedFiles.where((file) => file.type == 'video').toList();
    } else if (selectedFilter == "images") {
      return uploadedFiles.where((file) => file.type == 'image').toList();
    }
    return uploadedFiles; // Fallback
  }

  // Default filter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            APPBarWidget(),
            size.height(32),
            Row(
              children: [
                size.width(25),
                SearshBarWidget(),
              ],
            ),
            size.height(32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  size.width(20),
                  FilesButtonWidget(
                    image: 'assets/images/AllworkSpaces.svg',
                    innerText: 'All Workspaces',
                    border: true,
                    allWorkSpaces: true,
                  ),
                  size.width(20),
                  FilesButtonWidget(
                    image: 'assets/images/Files.svg',
                    innerText: 'Work space name',
                    border: false,
                    allWorkSpaces: false,
                  ),
                  size.width(20), // Optional trailing space
                ],
              ),
            ),
            size.height(32),
            Divider(
              color: Colors.grey[300], // Light gray
              thickness: 1.2, // Adjust the thickness if needed
              height: 1, // Space the divider takes vertically
            ),
            size.height(20),
            FilesButtons2Widget(
              onFileUploaded: (file) {
                setState(() {
                  uploadedFiles.add(
                      file); // allFiles is what you're using in your GridView
                });
              },
            ),
            size.height(20),
            TaskFilterWidget(
              filters: filters,
              selectedFilter: selectedFilter,
              onFilterSelected: (filter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: filteredFiles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return FileCard(data: filteredFiles[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverAppBarDelegate({required this.child, this.height = 80});

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
