import 'package:project_graduation/Core/Imports/common_imports.dart';

class dialogWidget extends StatelessWidget {
  final VoidCallback deleteClick;
  final VoidCallback updateClick;
  const dialogWidget({
    super.key,
    required this.deleteClick,
    required this.updateClick,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsClass.lightBlue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          size.width(25),
          ElevatedButton(
            onPressed: deleteClick,
            child: Text("delete"),
          ),
          size.width(25),
          ElevatedButton(
            onPressed: updateClick,
            child: Text("update"),
          ),
        ],
      ),
    );
  }
}
