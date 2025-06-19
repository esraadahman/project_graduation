import 'package:gradution_project/Core/Imports/common_imports.dart';

class Documentation extends StatelessWidget {
  const Documentation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * .9,
      height: height(context) * .06,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: CustomDecoration.grayDecoration3(),
      child: Row(
        children: [
          Image.asset(
            "assets/images/star.png",
            width: 30,
            height: 30,
          ),
          Text("   Documentation",
              style: styling.subtitle.copyWith(
                  fontSize: 13,
                  color: ColorsClass.text,
                  fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
