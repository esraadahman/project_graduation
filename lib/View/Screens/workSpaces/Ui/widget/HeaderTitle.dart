import 'package:gradution_project/Core/Imports/common_imports.dart';

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
      backgroundColor: ColorsClass.colorwhite,
      elevation: 0,
      automaticallyImplyLeading: false, // We handle back manually

      flexibleSpace: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Back button (left)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => context.goBack(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),

            // Title (center)
            Center(
              child: Text(
                title,
                style: styling.maintitle.copyWith(
                  fontSize: 20.sp,
                  color: ColorsClass.text,
                ),
              ),
            ),

            // More icon (right)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onMorePressed,
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
