import 'package:project_graduation/Core/Imports/common_imports.dart';

class HeaderTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMorePressed;

  const HeaderTitle({
    Key? key,
    required this.title,
   required this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: styling.maintitle.copyWith(fontSize: 20.sp),
      ),
      centerTitle: true,
      backgroundColor: ColorsClass.colorwhite,
      leading: IconButton(
        onPressed: () {
          context.goBack();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 30,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onMorePressed,
          icon: const Icon(
            Icons.more_vert_rounded,
            size: 25,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
