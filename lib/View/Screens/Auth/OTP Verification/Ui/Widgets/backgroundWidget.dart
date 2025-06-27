import 'package:gradution_project/Core/Imports/common_imports.dart';

class bacground_widget extends StatelessWidget {
  const bacground_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/Frame 37318.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
