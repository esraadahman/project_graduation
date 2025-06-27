import 'dart:io';
import 'package:gradution_project/Core/Imports/common_imports.dart';


class FilesButtons2Widget extends StatefulWidget {
  final Function(FileCardData) onFileUploaded;

  const FilesButtons2Widget({super.key, required this.onFileUploaded});

  @override
  State<FilesButtons2Widget> createState() => _FilesButtons2WidgetState();
}

class _FilesButtons2WidgetState extends State<FilesButtons2Widget> {
  List<FileCardData> uploadedFiles = [];

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

      // ✅ Create file data with uploaded date
      final uploadedData = FileCardData(
        name: name,
        file: file,
        type: type,
        uploadedDate: DateTime.now(),
      );

      setState(() {
        uploadedFiles.add(uploadedData);
      });

      widget.onFileUploaded(uploadedData);
    }
  }
  bool sortByLatest = true;

 sortFilesByDate() {
  setState(() {
    sortByLatest = !sortByLatest; // Toggle sort
    uploadedFiles.sort((a, b) => sortByLatest
        ? b.uploadedDate.compareTo(a.uploadedDate) // Newest first
        : a.uploadedDate.compareTo(b.uploadedDate)); // Oldest first
  });
}


  void showFloatingAttachmentMenu(
      BuildContext context, Offset position, Function(FileCard) onFilePicked) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // This will dismiss the overlay when tapped
          Positioned.fill(
            child: GestureDetector(
              onTap: () => entry.remove(),
              behavior: HitTestBehavior.translucent,
            ),
          ),
          // Your floating menu
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildAttachmentItem(
                        icon: Icons.image,
                        text: "Photo & Video",
                        onTap: () {
                          pickAndAddFile(FileType.image);
                          entry.remove();
                        },
                      ),
                      buildAttachmentItem(
                        icon: Icons.camera_alt,
                        text: "Image",
                        onTap: () {
                          pickAndAddFile(FileType.image);
                          entry.remove();
                        },
                      ),
                      buildAttachmentItem(
                        icon: Icons.videocam,
                        text: "Video",
                        onTap: () {
                          pickAndAddFile(FileType.video);
                          entry.remove();
                        },
                      ),
                      buildAttachmentItem(
                        icon: Icons.insert_drive_file,
                        text: "Document",
                        onTap: () {
                          pickAndAddFile(FileType.any);
                          entry.remove();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: width(context) * .04),
        SizedBox(
          height: height(context) * .07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsClass.primary,
              padding: EdgeInsets.symmetric(
                horizontal: width(context) * .045,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: width(context) * .01),
                Text(
                  'Upload New File',
                  style: styling.subtitle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final RenderBox box = context.findRenderObject() as RenderBox;
                if (box.hasSize) {
                  final Offset position = box.localToGlobal(Offset.zero) +
                      Offset(0, box.size.height + 10);
                  showFloatingAttachmentMenu(context, position, (_) {});
                } else {
                  debugPrint("RenderBox has no size yet.");
                }
              });
            },
          ),
        ),
        Spacer(),
        SortButton(label: "Time", onPressed: sortFilesByDate, ),
        SizedBox(width: width(context) * .04),
      ],
    );
  }
}
