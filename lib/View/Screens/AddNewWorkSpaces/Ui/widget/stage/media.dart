import '../../../../../../Core/Imports/common_imports.dart';

class MediaScreen extends StatelessWidget {
  final VoidCallback ontap1;
  MediaScreen({super.key, required this.ontap1});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width(context) * 0.9,
        margin: EdgeInsets.only(
            left: width(context) * .05, right: width(context) * .05),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Media (Optional)",
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(10),
          GestureDetector(
            onTap: ontap1,
            child: DottedBorder(
              color: ColorsClass.border_color,
              strokeWidth: 2,
              dashPattern: [8, 4],
              child: Container(
                width: width(context) * 0.9,
                margin: EdgeInsets.only(
                    left: width(context) * .05, right: width(context) * .05),
                height: height(context) * .3,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      size: width(context) / 13,
                      color: ColorsClass.password_text,
                    ),
                    Text(
                      ' Drop your related files here or click to upload',
                      style: styling.subtitle.copyWith(
                          color: ColorsClass.password_text,
                          fontSize: width(context) / 30),
                    ),
                  ],
                )),
              ),
            ),
          ),
        ]));
  }
}
