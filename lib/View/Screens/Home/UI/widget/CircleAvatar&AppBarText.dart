import 'package:project_graduation/Core/Imports/common_imports.dart';

class CircleAvatarAndAppBarText extends StatelessWidget {
  const CircleAvatarAndAppBarText({super.key ,required this.userImage, required this.userName});
 final String userImage;
 final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundImage:  NetworkImage(
                        userImage
                        //"https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid"),
                  ),
                ),),
                size.width(16),
                Column(
                  children: [
                    size.height(48.w),
                    Text(
                      "Welcome to bridge it",
                      style: styling.subtitle.copyWith(
                        fontSize: 16.sp,
                        color: ColorsClass.lightGrey,
                      ),
                    ),
                    size.height(5),
                    SizedBox(
                      width: 155.w, // Set your desired width
                      child: Text(
                        userName,
                        style: styling.subtitle.copyWith(
                            fontSize: 16.sp, color: ColorsClass.colorwhite),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
         ) ,
      ],
    );
  }
}