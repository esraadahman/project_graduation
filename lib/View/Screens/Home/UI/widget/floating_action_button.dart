import 'package:gradution_project/Core/Imports/common_imports.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorsClass.light_gradient,
      elevation: 6, // Adds shadow for a more elevated look
      shape: const CircleBorder(), // Background color for the FAB
      child: const Icon(
        Icons.add,
        color: Colors.white, // Icon color
        size: 35, // Icon size; adjust as needed
      ), // Ensure it is circular
    );
  }
}
