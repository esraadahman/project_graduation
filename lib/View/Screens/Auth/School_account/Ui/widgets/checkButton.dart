import 'package:project_graduation/Core/Imports/common_imports.dart';

class GradientCheckBoxWidget extends StatefulWidget {
  const GradientCheckBoxWidget({super.key, required this.text});
  final String text;

  @override
  State<GradientCheckBoxWidget> createState() => _GradientCheckBoxWidgetState();
}

class _GradientCheckBoxWidgetState extends State<GradientCheckBoxWidget> {
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
         size.width(width(context) * .04),
          Container(
            width: width(context) / 30,
            height: width(context) / 31,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4), // Rounded corners
              gradient: _isChecked
                  ? ColorsClass.appGradient // Use gradient when checked
                  : null, // No gradient when unchecked
              border: Border.all(
                color: Colors.grey.shade400, // Border color
                width: 1.0, // Border width
              ),
            ),
            child: _isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: width(context) / 40,
                  )
                : null, // Show checkmark if checked
          ),
          SizedBox(width: 8),
          Text(widget.text,
              style: styling.subtitle.copyWith(
                fontSize: width(context) / 37,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          size.width(20)
        ],
      ),
    );
  }
}
