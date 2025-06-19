import 'package:gradution_project/Core/Imports/common_imports.dart';

class TextButtonWidgetLoginOrSignUp extends StatelessWidget {
  const TextButtonWidgetLoginOrSignUp({
    super.key,
    required this.onTap,
    required this.text,
    this.isbold = true,
  });
  final VoidCallback onTap;
  final String text;
  final bool isbold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(width(context) * .0001),
        TextButton(
            onPressed: onTap,
            child: Text(text,
                style: styling.subtitle.copyWith(
                    decoration: TextDecoration.underline,
                    color: ColorsClass.primary,
                    fontSize: width(context) / 35,
                    fontWeight: isbold ? FontWeight.bold : FontWeight.normal))),
      ],
    );
  }
}
