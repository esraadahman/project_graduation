import 'package:project_graduation/Core/Imports/common_imports.dart';

class membersWidget extends StatelessWidget {
  final int num_member;
  final List<String> images_of_members; // Specify the type of the list

  membersWidget({
    super.key,
    required this.num_member,
    required this.images_of_members,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${num_member} Team Members  ",
          style:
              styling.subtitle.copyWith(color: ColorsClass.date, fontSize: 14.sp),
        ),
        Spacer(), // This will push the images to the right side
        SizedBox(
          height: 30,
          width: 110,
          child: Stack(
            children: List.generate(
              images_of_members.length > 5
                  ? 5
                  : images_of_members.length, // Limit to 5 members
              (index) => Positioned(
                left: index * 20.0,
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    images_of_members[index], // Use the URL from the list
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
