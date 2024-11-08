import 'package:project_graduation/Core/Imports/common_imports.dart';

class emailWidget extends StatelessWidget {
  const emailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(15),
        Text(
          LangClass.translate(context, "email_placeholder"),
          style: styling.maintitle
              .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
