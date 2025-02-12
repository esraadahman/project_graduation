import 'package:project_graduation/Core/Imports/common_imports.dart';

class SortButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  SortButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: ColorsClass.date, 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: styling.subtitle.copyWith(fontSize: 16 , color: ColorsClass.sub_text)),
          SizedBox(width: 4), // Spacing between text and icon
         SvgPicture.asset(
              height: 15.0,
              color: ColorsClass.sub_text,
              width: 15.0,
              'assets/images/sort.svg'
            ),
        ],
      ),
    );
  }
}