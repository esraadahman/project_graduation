import 'package:project_graduation/Core/Imports/common_imports.dart';

class containerOFImageOFWorkSpace extends StatelessWidget {
  String image;
  String title;
  String date;
  List<String> imagelist;
  int numMembers;
  containerOFImageOFWorkSpace(
      {Key? key,
      required this.image,
      required this.title,
      required this.date,
      required this.numMembers,
      required this.imagelist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.heightMedia(context, .45),
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: CustomDecoration.grayDecoration(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: imageWorkSpace(
              image: image,
            ),
          ),
          size.height(15),
          nameWorkSpace(
            title: title,
            date: date,
          ),
          size.height(15),
          membersWidget(num_member: numMembers, images_of_members: imagelist)
        ],
      ),
    );
  }
}
