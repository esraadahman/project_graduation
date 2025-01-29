import 'package:project_graduation/Core/Imports/common_imports.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? ColorsClass.primary : ColorsClass.lightGrey,
      ),
      width: active ? width(context)/15 : width(context)/30,
      height: 10,
    );
  }
}
