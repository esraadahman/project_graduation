import 'package:gradution_project/Core/Imports/common_imports.dart';

class Bottomsheettheme {
  Bottomsheettheme._();

  /* *
  bottomSheetThemeData contains  this properties:
    backgroundColor,
    surfaceTintColor,
    elevation,
    modalBackgroundColor,
    modalBarrierColor,
    shadowColor,
    modalElevation,
    shape,
    showDragHandle,
    dragHandleColor,
    dragHandleSize,
    clipBehavior,
    constraints,
  */
  // light theme
  static const BottomSheetThemeData lightThemeBottomSheet =
      BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );

// dark theme
  static const BottomSheetThemeData darkThemeBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}
