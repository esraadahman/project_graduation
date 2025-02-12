import 'package:project_graduation/Core/Imports/common_imports.dart';

class iconsRowWidget extends StatelessWidget {
  final VoidCallback filesIcon;
  final VoidCallback chatIcon;
  final double spacing;
  final bool smallOrnot ;

  const iconsRowWidget(
      {super.key,
      required this.filesIcon,
      required this.chatIcon,
      this.spacing = 0.0 , this.smallOrnot = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: filesIcon,
          child: Container(
              width: size.widthMedia(context, .15),
              height: size.heightMedia(context, .07),
              padding: const EdgeInsets.all(8),
              decoration: CustomDecoration.grayDecorationForSmall(smallOrnot),
              child: SvgPicture.asset(
                'assets/images/tabler_folders.svg',
                height: 32.h,
              )),
        ),
        SizedBox(width: spacing),
        GestureDetector(
          onTap: chatIcon,
          child: Container(
              width: size.widthMedia(context, .15),
              height: size.heightMedia(context, .07),
              padding: const EdgeInsets.all(8),
              decoration: CustomDecoration.grayDecorationForSmall(smallOrnot),
              child: SvgPicture.asset(
                'assets/images/mage_message-dots-round.svg',
                height: 32.h,
              )),
        ),
        SizedBox(width: spacing),
        Flexible(
          child: Container(
              width: size.widthMedia(context, .6),
              height: size.heightMedia(context, .07),
              decoration: CustomDecoration.grayDecorationForSmall(smallOrnot),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: SvgPicture.asset(
                      height: 40.0,
                      'assets/images/tabler_progress.svg',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '24% complete',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                16.sp, // Responsive font size using ScreenUtil
                            color: ColorsClass.homeCardText,
                          ),
                        ),
                        const SizedBox(height: 8), // Use SizedBox for spacing
                        Container(
                          width: size.widthMedia(
                              context, .4), // 80% of screen width
                          child: LinearProgressIndicator(
                            value: 0.24,
                            backgroundColor: Colors.grey
                                .shade300, // Background color of the progress bar
                            color: Colors.blue, // Progress color
                          ),
                        ),
                      ],
                    ),
                  ),
                  size.width(5),
                ],
              )),
        ),
      ],
    );
  }
}
