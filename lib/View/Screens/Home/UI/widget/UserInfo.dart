import 'package:gradution_project/Core/Imports/common_imports.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) / 5,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: ColorsClass.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: Padding(
        padding: EdgeInsets.only(
          top: height(context) * .03,
          //  left: width(context) * .06,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatarAndAppBarText(
              userImage:
                  "https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
              userName: "Mariam Mohie",
            ),
            size.width(width(context) * .09),
            const NoteficationIconWidget(),
          ],
        ),
      ),
    );
  }
}
