import 'package:gradution_project/Core/Imports/common_imports.dart';

class Send2 extends StatefulWidget {
  const Send2({super.key});

  @override
  State<Send2> createState() => _Send2State();
}

class _Send2State extends State<Send2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom, // adjusts for keyboard
      ),
      decoration: const BoxDecoration(
        color: ColorsClass.lightBlue2,
        border: Border(
          top: BorderSide(color: ColorsClass.border_color),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Type a message',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: ColorsClass.border_color),
          ),
          filled: true,
          fillColor: ColorsClass.lightBlue2,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
