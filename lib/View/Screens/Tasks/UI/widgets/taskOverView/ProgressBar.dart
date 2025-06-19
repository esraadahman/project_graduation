import 'package:gradution_project/Core/Imports/common_imports.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.presnt,
  });

  final int presnt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Progress",
              style: styling.subtitle.copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              "${presnt}%",
              style: styling.subtitle.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
        size.height(15),
        Container(
          height: 13,
          width: width(context),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Container(
                height: 13,
                width: width(context) * (presnt / 100).clamp(0.0, 1.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
