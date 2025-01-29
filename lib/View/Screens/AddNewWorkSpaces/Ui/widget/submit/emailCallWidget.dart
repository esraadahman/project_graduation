import 'package:project_graduation/Core/Imports/common_imports.dart';

class emailCallWidget extends StatelessWidget {
  final VoidCallback onTap;
  const emailCallWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('If you face any problem, Please contact us by ',
            style: styling.maintitle.copyWith(fontSize: 13)),
        GestureDetector(
          onTap: onTap,
          child: Text('email',
              style: styling.maintitle.copyWith(
                fontSize: 13,
                decoration: TextDecoration.underline,
              )),
        ),
      ],
    );
  }
}