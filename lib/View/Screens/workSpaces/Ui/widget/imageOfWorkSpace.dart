import 'package:project_graduation/Core/Imports/common_imports.dart';

class imageWorkSpace extends StatelessWidget {
  String image;
  String title;
  imageWorkSpace({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: image == ''
                ? Container(
                    height: size.heightMedia(context, .3),
                    color: ColorsClass.password_text,
                    child: Center(
                      child: Text(
                        title.substring(0, 2).toUpperCase(),
                        style: styling.maintitle,
                      ),
                    ),
                  )
                : Container(
                    height: size.heightMedia(context, .3),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover)),
                  )),
        Positioned(
          top: 12,
          right: 2,
          child: Opacity(
            opacity: 0.7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ColorsClass.dark_gradient,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text(
                'CATEGORY',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        // Dots menu (ellipsis)
        const Positioned(
          top: 12,
          left: 12,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: ColorsClass.colorwhite,
            child: Icon(
              Icons.more_horiz,
              color: ColorsClass.checkBoxText,
            ),
          ),
        ),
      ],
    );
  }
}
