import 'package:gradution_project/Core/Imports/common_imports.dart';

String formateDate(String date) {
  DateTime dateTime = DateTime.parse(date);

  // Format to relative time
  String relativeTime = GetTimeAgo.parse(dateTime);

  print(relativeTime);
  return relativeTime;
}
