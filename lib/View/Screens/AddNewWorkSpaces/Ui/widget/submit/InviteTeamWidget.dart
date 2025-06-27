import 'package:gradution_project/Core/Imports/common_imports.dart';


class InviteTeamWidget extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback onTap;
  final List<UserModel> userList;
  final Function(UserModel) onUserSelected;

  const InviteTeamWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onTap,
    required this.userList,
    required this.onUserSelected,
    this.controller,
  });

  @override
  State<InviteTeamWidget> createState() => _InviteTeamWidgetState();
}

class _InviteTeamWidgetState extends State<InviteTeamWidget> {
  @override
  Widget build(BuildContext context) {
    UserModel? selectedUser;

    return Container(
      width: width(context) * 0.9,
      margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText,
              style: styling.subtitle
                  .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          size.height(5),
          Row(
            children: [
              SizedBox(
                width: width(context) * .7,
                height: height(context) * .07,
                child: DropdownButtonFormField<UserModel>(
                  dropdownColor: ColorsClass.lightGrey,
                  style: styling.subtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: ColorsClass.text,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  value: selectedUser,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: ColorsClass.border_color),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: ColorsClass.border_color),
                    ),
                  ),
                  hint: Text(widget.hintText ?? "Select a user"),
                  items: widget.userList.map((user) {
                    return DropdownMenuItem<UserModel>(
                      value: user,
                      child: Text(user.name),
                    );
                  }).toList(),
                  onChanged: (user) {
                    if (user != null) {
                      setState(() {
                        selectedUser = user;
                      });
                      widget.onUserSelected(user);
                    }
                  },
                ),
              ),
              size.width(width(context) * .03),
              SizedBox(
                height: height(context) * .07,
                child: ElevatedButton(
                  onPressed: widget.onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsClass.primary,
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * .005),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Invite",
                    style: styling.subtitle.copyWith(
                      fontSize: width(context) / 30,
                      color: ColorsClass.colorwhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //  size.height(40),
          // const DividerWithText(text: "Or With"),
          // size.height(15.h),
        ],
      ),
    );
  }
}
