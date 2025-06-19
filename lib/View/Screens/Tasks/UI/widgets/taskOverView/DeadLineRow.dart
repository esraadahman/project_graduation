import 'package:gradution_project/Core/Imports/common_imports.dart';

class DeadLineRow extends StatelessWidget {
  const DeadLineRow({
    super.key,
    required this.deadline,
  });
  final String deadline;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/deadline.svg',
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 4),
            Text(
              '  Deadline',
              style: styling.subtitle.copyWith(
                fontSize: 16,
                color: Colors.orange,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Text(
          deadline,
          style: styling.subtitle.copyWith(
            fontSize: 14,
            color: ColorsClass.sub_text,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
