import 'package:project_graduation/Core/Imports/common_imports.dart';

class Confirmbutton extends StatelessWidget {
  Confirmbutton({
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
          color: ColorsClass.primary,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
