import 'package:project_graduation/Core/Imports/common_imports.dart';

class Confirmbutton extends StatelessWidget {
  const Confirmbutton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 290,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsClass.primary),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
