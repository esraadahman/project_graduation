import 'package:gradution_project/Core/Imports/common_imports.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.HeaderTitle,
    required this.HeaderSubTitle,
    required this.HeaderDate,
    required this.UserImage,
  });

  final String HeaderTitle;
  final String HeaderSubTitle;
  final String HeaderDate;
  final String UserImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(UserImage),
            backgroundColor: Colors.grey[300],
          ),
          size.width(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(HeaderTitle,
                    style: styling.maintitle.copyWith(
                      color: ColorsClass.sub_text,
                      fontSize: 20,
                    )),
                size.height(3),
                Text(HeaderSubTitle,
                    style: styling.maintitle.copyWith(
                      color: ColorsClass.sub_text,
                      fontSize: 13,
                    )),
              ],
            ),
          ),
          Text(
            HeaderDate,
            style: styling.maintitle.copyWith(
              color: ColorsClass.sub_text,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
