import 'package:gradution_project/Core/Imports/common_imports.dart';

class CircleAvatarAndAppBarText extends StatelessWidget {
  const CircleAvatarAndAppBarText(
      {super.key, required this.userImage, required this.userName});
  final String userImage;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: width(context) / 10,
          backgroundImage: NetworkImage(userImage
              //"https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid"),
              ),
        ),
        size.width(width(context) * .02),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to bridge it",
              style: styling.subtitle.copyWith(
                fontSize: width(context) / 25,
                color: ColorsClass.lightGrey,
              ),
            ),
            Text(
              userName,
              style: styling.subtitle.copyWith(
                  fontSize: width(context) / 25, color: ColorsClass.colorwhite),
              overflow: TextOverflow.ellipsis,
            ),
            size.height(5)
          ],
        ),
      ],
    );
  }
}
