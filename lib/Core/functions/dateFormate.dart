import 'package:get_time_ago/get_time_ago.dart';


 String formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    // Format to relative time
    String relativeTime = GetTimeAgo.parse(dateTime);

    print(relativeTime);
    return relativeTime;
  }

