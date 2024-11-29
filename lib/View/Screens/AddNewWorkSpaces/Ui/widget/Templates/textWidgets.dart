import '../../../../../../Core/Imports/common_imports.dart';

class Textwidgets extends StatelessWidget {
  final VoidCallback onTap1;
  const Textwidgets({super.key, required this.onTap1});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width(context) * .05, right: width(context) * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suggested Templates\nbased on your stage ",
                style: styling.maintitle.copyWith(fontSize: 22),
              ),
              TextButton(
                onPressed: onTap1,
                child: Text("Skip\n",
                    style: styling.subtitle.copyWith(
                        fontSize: 21,
                        color: ColorsClass.primary,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.0,
                        decorationColor: ColorsClass.primary,
                        fontWeight: FontWeight.normal)),
              )
            ],
          ),
        ),
        size.height(10),
        Container(
            width: width(context) * 0.9,
            margin: EdgeInsets.only(
                left: width(context) * .05, right: width(context) * .05),
            child: Text(
              "Find templates to help you quickly design out\nyour ideas. Easy to use, whether you're a\nbeginner or an expert.",
              style: styling.subtitle
                  .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
