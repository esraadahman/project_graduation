import 'package:project_graduation/Core/Imports/common_imports.dart';

class imageWidget2 extends StatelessWidget {
  imageWidget2({super.key, required this.image_src});
  String image_src;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image_src),
      ],
    );
  }
}
