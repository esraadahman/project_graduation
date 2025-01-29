import 'package:project_graduation/Core/Imports/common_imports.dart';

class imageWidget2 extends StatelessWidget {
  imageWidget2({super.key, required this.image_src});
  String image_src;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
            fit: BoxFit.cover,
            width: width(context) / 3,
            height: height(context) / 5,
            image: AssetImage(
              image_src,
            ))
      ],
    );
  }
}
