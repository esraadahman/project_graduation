import '../../../../../../Core/Imports/common_imports.dart';

class Objective_Button extends StatelessWidget {
  final TextEditingController? controller;
  const Objective_Button({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width(context) * 0.9,
        margin: EdgeInsets.only(
            left: width(context) * .05, right: width(context) * .05),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Objective",
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(5),
          SizedBox(
            width: width(context),
            height: height(context) * .25,
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: ColorsClass.border_color, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                          color: ColorsClass.border_color, width: 1)),
                  hintText: "Enter your project objectives ",
                  hintStyle: styling.subtitle
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 14)),
              controller: controller,
              minLines: 7,
              maxLines: 10,
            ),
          ),
          size.height(40),
        ]));
  }
}
