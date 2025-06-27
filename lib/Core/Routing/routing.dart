import 'package:gradution_project/Core/Imports/common_imports.dart';

extension NavigationRouter on BuildContext {
  // used to navigate to another screen

  void navigateTo(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

  // used to back
  void goBack() {
    Navigator.of(this).pop();
  }
}
