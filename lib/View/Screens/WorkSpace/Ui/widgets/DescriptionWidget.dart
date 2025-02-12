import 'package:project_graduation/Core/Imports/common_imports.dart';

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
        padding: EdgeInsets.only(left: 7, right: 10),
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
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: ColorsClass.appGradient.colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: const Icon(
                      Icons.edit_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              des ?? '', // Handle potential null values
              style: styling.subtitle.copyWith(
                fontSize: 14,
                color: ColorsClass.border_color,
                fontWeight: FontWeight.normal,
              ),
              softWrap: true, 
              overflow:
                  TextOverflow.ellipsis, 
            )
          ],
        ));
  }
}
