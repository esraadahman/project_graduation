import 'package:gradution_project/Core/Imports/common_imports.dart';

class DescriptionWidget extends StatelessWidget {
  final VoidCallback onclick;
  final String? des;
  const DescriptionWidget({
    super.key,
    required this.onclick,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width(context) * .9,
        height: height(context) * .2,
        padding: const EdgeInsets.only(left: 7, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Description',
                    style: styling.maintitle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
                GestureDetector(
                  onTap: onclick,
                  child: SvgPicture.asset(
                    "assets/images/pin.svg",
                    width: 27,
                    height: 27,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: des!.length > 100 ? 200 : double.infinity,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    des ?? '',
                    style: styling.subtitle.copyWith(
                      fontSize: 14,
                      color: ColorsClass.border_color,
                      fontWeight: FontWeight.normal,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
