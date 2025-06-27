import 'package:gradution_project/Core/Imports/common_imports.dart';

class ImagesVideo extends StatelessWidget {
  String chatid;
  ImagesVideo({super.key, required this.chatid});

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          size.height(10),
          // take photo
          GestureDetector(
            onTap: () async {
              // cubit.profilePic =
              //     await ImagePicker().pickImage(source: ImageSource.camera);

              // if (cubit.profilePic != null) {
              //   print("enter if not null");

              //   await cubit.sendimage(chatid, cubit.profilePic!);
              // } else {
              //   print("No image selected");
              // }
              try {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  print('Selected image: ${image.path}');
                }
              } catch (e) {
                print('Error picking image: $e');
              }
            },
            child: ListTile(
              leading: Icon(Icons.camera_alt_outlined,
                  size: 25.sp, color: ColorsClass.text),
              title: Text('Take photo',
                  style: styling.subtitle.copyWith(
                      fontSize: 15.sp,
                      color: ColorsClass.text,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          size.height(10),
          // upload photo
          GestureDetector(
            onTap: () async {
              // cubit.profilePic =
              //     await ImagePicker().pickImage(source: ImageSource.gallery);

              // if (cubit.profilePic != null) {
              //   print("enter if not null");

              //   await cubit.sendimage(chatid, cubit.profilePic!);
              // } else {
              //   print("No image selected");
              // }
              try {
                final XFile? video =
                    await _picker.pickVideo(source: ImageSource.gallery);
                if (video != null) {
                  // Handle the selected video
                  print('Selected video: ${video.path}');
                }
              } catch (e) {
                print('Error picking video: $e');
              }
            },
            child: ListTile(
              leading: Icon(Icons.image, size: 25.sp, color: ColorsClass.text),
              title: Text('Upload image',
                  style: styling.subtitle.copyWith(
                      fontSize: 15.sp,
                      color: ColorsClass.text,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          size.height(10),
          // upload video
          GestureDetector(
            onTap: () async {
              // cubit.video =
              //     await ImagePicker().pickVideo(source: ImageSource.gallery);

              // if (cubit.video != null) {
              //   await cubit.sendvideo(chatid, cubit.video!);
              // } else {
              //   print("No video selected");
              // }

              //   Upload video
              //  final XFile? video =
              //     await ImagePicker().pickVideo(source: ImageSource.gallery);

              // if (video != null) {
              //   await SingleChatNetwork.uploadVideo(chatid, video);
              // } else {
              //   print("No video selected");
              // }
              final XFile? video =
                  await ImagePicker().pickVideo(source: ImageSource.gallery);

              if (video != null) {
                print('Selected video: ${video.path}');
              } else {
                print("No video selected");
              }
            },
            child: ListTile(
              leading: Icon(Icons.video_collection,
                  size: 25.sp, color: ColorsClass.text),
              title: Text('Upload video',
                  style: styling.subtitle.copyWith(
                      fontSize: 15.sp,
                      color: ColorsClass.text,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
