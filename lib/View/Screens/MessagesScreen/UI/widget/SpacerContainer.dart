import 'package:gradution_project/Core/Imports/common_imports.dart';

class SpacerContainer extends StatelessWidget {
  const SpacerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        size.height(20),
        Padding(
          padding: const EdgeInsets.only(
            left: 28,
          ),
          child: Container(
            height: 2,
            width: width(context) / 1.25,
            decoration:
                BoxDecoration(color: ColorsClass.sub_text.withOpacity(0.2)),
          ),
        ),
        size.height(30)
      ],
    );
  }
}
