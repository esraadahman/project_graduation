import 'package:project_graduation/Core/Imports/common_imports.dart';

class Confirmbuttonprimary extends StatelessWidget {
  Confirmbuttonprimary({
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
        width: width(context) * .9,
        height: height(context) * .06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsClass.buttonColorPrimary,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: ColorsClass.dark_gradient,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
