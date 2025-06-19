import 'package:gradution_project/Core/Imports/common_imports.dart';


class ProfileGradientSameAs extends StatefulWidget {
  const ProfileGradientSameAs({super.key, required this.text});
  final String text;

  @override
  State<ProfileGradientSameAs> createState() => _GradientCheckBoxWidgetState();
}

class _GradientCheckBoxWidgetState extends State<ProfileGradientSameAs> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Row(
        children: [
         size.width(width(context) * .02),
          Container(
            width: width(context) / 20,
            height: width(context) / 21,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4), // Rounded corners
              gradient: _isChecked
                  ? ColorsClass.appGradient // Use gradient when checked
                  : null, // No gradient when unchecked
              border: Border.all(
                color: ColorsClass.text,
                width: 1.0, // Border width
              ),
            ),
            child: _isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: width(context) / 35,
                  )
                : null, // Show checkmark if checked
          ),
          SizedBox(width: 8),
          Text(widget.text,
              style: styling.subtitle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              )),
          size.width(20)
        ],
      ),
    );
  }
}
