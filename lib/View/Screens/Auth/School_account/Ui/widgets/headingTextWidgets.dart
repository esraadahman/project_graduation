import 'package:project_graduation/Core/Imports/common_imports.dart';


class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({super.key ,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    size.width(10),
                   Text(text , style: const TextStyle(fontSize: 26 ,fontWeight: FontWeight.bold),),
                  ],
                );
  }
}