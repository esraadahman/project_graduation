import 'package:gradution_project/Core/Imports/common_imports.dart';

class DeadLineWidget extends StatelessWidget {
  const DeadLineWidget({
    super.key,
    required this.controller,
    required this.onDateTap,
    this.title = "Deadline",
    this.labelText = "Choose your project deadline",
    this.selected = false,
  });

  final TextEditingController controller;
  final VoidCallback onDateTap;
  final String title;
  final String labelText;
  final  bool selected ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) * 0.9,
      // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: styling.subtitle.copyWith(
              color: ColorsClass.password_text,
              fontSize: 14,
            ),
          ),
          size.height(10),
          TextField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:  BorderSide(
                  color:selected ?Colors.red : ColorsClass.border_color,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color:selected ?Colors.red : ColorsClass.border_color,
                  width: 1,
                ),
              ),
              labelText: labelText,
              labelStyle: styling.subtitle.copyWith(
                color: ColorsClass.password_text,
                fontSize: width(context) / 30,
                fontWeight: FontWeight.normal,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.date_range_outlined,
                  color: ColorsClass.password_text,
                  size: width(context) / 14,
                ),
                onPressed: onDateTap,
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
