import 'package:gradution_project/Core/Imports/common_imports.dart';

class UserInfoTop extends StatefulWidget {
  const UserInfoTop({
    super.key,
    required this.userImage,
    required this.userName,
    required this.items,
  });

  final String userImage;
  final String userName;
  final List<String> items;

  @override
  State<UserInfoTop> createState() => _UserInfoTopState();
}

class _UserInfoTopState extends State<UserInfoTop> {
  String? _selectedValue;
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
        ),
        child: Row(
          children: [
            size.width(width(context) * .05),
            CircleAvatar(
              radius: width(context) / 10,
              backgroundImage: NetworkImage(widget.userImage),
            ),
            size.width(width(context) * .08),
            Column(
              children: [
                size.height(25.h),
                Text(
                  '${widget.userName}          ',
                  style: styling.subtitle.copyWith(
                    fontSize: width(context) / 25,
                    color: ColorsClass.lightGrey,
                  ),
                ),
                size.height(10.h),
                SizedBox(
                  width: width(context) / 2.4,
                  height: height(context) * 0.06,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorsClass.primary,
                      border: Border.all(color: ColorsClass.colorwhite),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: _selectedValue,
                        borderRadius: BorderRadius.circular(15),
                        icon: Transform.rotate(
                          angle: 4.7124, // Rotate the icon to point down
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: ColorsClass.colorwhite,
                          ),
                        ),
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            'Work Space Name',
                            style: styling.subtitle.copyWith(
                                //  fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: ColorsClass.colorwhite),
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        underline: const SizedBox(),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.items.map((String value) {
                            return Center(
                              child: Text(
                                value,
                                style: styling.subtitle.copyWith(
                                  // fontWeight: FontWeight.normal,
                                  color: ColorsClass.colorwhite,
                                  fontSize: 13,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        items: widget.items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: styling.subtitle.copyWith(
                                //   fontWeight: FontWeight.normal,
                                color: ColorsClass.text,
                                fontSize: 13,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            size.width(width(context) * .09),
            Icon(
              Icons.arrow_forward_ios,
              size: 26.sp,
              color: ColorsClass.colorwhite,
            ),
          ],
        ),
      ),
    );
  }
}
