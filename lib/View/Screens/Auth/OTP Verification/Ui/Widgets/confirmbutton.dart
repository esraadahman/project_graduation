import 'package:gradution_project/Core/Imports/common_imports.dart';

class Confirmbutton extends StatelessWidget {
  const Confirmbutton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(context) / 1.3,
        height: height(context) / 1.4 / 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsClass.primary,
        ),
        child: Center(
          child: Text(text,
              style: styling.maintitle.copyWith(
                color: Colors.white,
                fontSize: width(context) / 22,
              )),
        ),
      ),
    );
  }
}
