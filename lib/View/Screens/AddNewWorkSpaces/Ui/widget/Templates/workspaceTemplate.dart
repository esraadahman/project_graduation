import 'package:project_graduation/Core/Imports/common_imports.dart';

class Workspacetemplate extends StatelessWidget {
  String image;
  String title;
  List<String> imagelist;
  Workspacetemplate(
      {Key? key,
      required this.image,
      required this.title,
      required this.imagelist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * .58,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: CustomDecoration.grayDecoration2(),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorsClass.dark_gradient,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Text(
                          'CATEGORY',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                        Icons.favorite_border,
                        color: ColorsClass.checkBoxText,
                      ),
                    ),
                  ),
                ],
              )),
          size.height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: styling.maintitle.copyWith(fontSize: 18.sp),
              ),
              //   size.width(width(context) * .27),
              Text(
                "⭐⭐⭐⭐⭐ (350 Vote)",
                style: styling.subtitle.copyWith(fontSize: width(context) / 30),
              ),
            ],
          ),
          size.height(10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Brief summary of the template's purpose and key features",
              style: styling.subtitle
                  .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
              maxLines: 1,
            ),
          ),
          size.height(20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Used by XXX User",
                style: styling.subtitle.copyWith(
                    color: ColorsClass.date,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
              Spacer(), // This will push the images to the right side
              SizedBox(
                height: 30,
                width: 110,
                child: Stack(
                  children: List.generate(
                    imagelist.length > 5
                        ? 5
                        : imagelist.length, // Limit to 5 members
                    (index) => Positioned(
                      left: index * 20.0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          imagelist[index], // Use the URL from the list
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          size.height(15),
          Container(
            width: width(context) * .9,
            height: height(context) * .06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsClass.primary)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: SvgPicture.asset(
                    height: 22.0,
                    "assets/images/add.svg",
                  ),
                ),
                size.width(3),
                ShaderMask(
                  // ignore: prefer_const_constructors
                  shaderCallback: (bounds) => LinearGradient(
                    colors: const [
                      ColorsClass.dark_gradient,
                      ColorsClass.light_gradient
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text("Add to your work space",
                      style: styling.maintitle.copyWith(
                          fontSize: 14.sp, color: ColorsClass.colorwhite)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
