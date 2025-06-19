import 'package:gradution_project/Core/Imports/common_imports.dart';


class InformationWorkspace extends StatelessWidget {
  final String title;
  final String category;
  final VoidCallback onpointsClick;
  final VoidCallback shareclick;
  const InformationWorkspace(
      {super.key,
      required this.title,
      required this.category,
      required this.onpointsClick,
      required this.shareclick});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: height(context) * .1,
        left: width(context) * .035,
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: ColorsClass.colorwhite,
                  radius: 35,
                  child: TextGradiate(
                    text: Text(
                      title.substring(0, 2).toUpperCase(),
                      style: styling.maintitle,
                    ),
                    colors: ColorsClass.appGradient.colors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                Positioned(
                    left: 40,
                    top: 50,
                    child: CircleAvatar(
                      backgroundColor: ColorsClass.lightBlue,
                      radius: 15,
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
                    ))
              ],
            ),
            size.width(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: styling.maintitle
                        .copyWith(fontSize: 16, color: ColorsClass.colorwhite)),
                Text(category,
                    style: styling.maintitle
                        .copyWith(fontSize: 14, color: ColorsClass.lightBlue)),
              ],
            ),
            size.width(70),
            GestureDetector(
              onTap: shareclick,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: ColorsClass.appGradient.colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: const Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            size.width(20),
            GestureDetector(
              onTap: onpointsClick,
              child: const CircleAvatar(
                  backgroundColor: ColorsClass.colorwhite,
                  radius: 20,
                  child: Icon(
                    Icons.more_horiz,
                    size: 20,
                  )),
            ),
          ],
        ));
  }
}
