import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:flutter/cupertino.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: ColorsClass.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r))),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                size.width(22),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 37.r,
                    backgroundImage: const NetworkImage(
                        "https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid"),
                  ),
                ),
                size.width(15),
                Column(
                  children: [
                    size.height(65.w),
                    Text(
                      "Welcome to bridge it",
                      style: styling.subtitle.copyWith(
                        fontSize: 16.sp,
                        color: ColorsClass.lightGrey,
                      ),
                    ),
                    size.height(5),
                    SizedBox(
                      width: 155.w, // Set your desired width
                      child: Text(
                        'Mariam Mohie',
                        style: styling.subtitle.copyWith(
                            fontSize: 18.sp, color: ColorsClass.colorwhite),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                size.width(20),
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Container(
                    width: 53.w,
                    height: 53.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorsClass.colorwhite),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.bell,
                        color: ColorsClass.primary,
                        size: 25.r,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        size.height(30),
        SizedBox(
          width: 350,
          child: TextField(
            onChanged: (value) {
              // cubit.searchbyname(value);
            },
            decoration: InputDecoration(
              hintText: 'Search or jump to...',
              filled: true,
              fillColor: ColorsClass.background,
              prefixIcon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Stack(
                  clipBehavior:
                      Clip.none, // Allows overflow of the stars outside bounds
                  children: [
                    Icon(Icons.search,
                        size: 28,
                        color: ColorsClass.primary), // Main search icon
                    Positioned(
                      right: 4, // Position star closer to the top-right corner
                      top: -5,
                      child: Icon(Icons.star,
                          size: 10,
                          color: ColorsClass.primary), // Smaller sparkle
                    ),
                    Positioned(
                      right: 3, // Position star closer to the top-right corner
                      top: 5,
                      child: Icon(Icons.star,
                          size: 7,
                          color: ColorsClass.primary), // Smaller sparkle
                    ),
                  ],
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: ColorsClass.sub_text,
                  width: 0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Card1Widget(),
              size.height(40),
              Row(
                children: [
                  size.width(25),
                  Text(
                    "Next Tasks",
                    style: styling.maintitle.copyWith(
                        fontSize: 18.sp, color: ColorsClass.homeCardText),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.transparent,
                    border: Border.all(color: ColorsClass.lightGrey, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row with Start and Reminder
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.26),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.blue,
                                size: 45,
                              ),
                            ),
                            size.width(8),
                            Column(
                              children: [
                                Text(
                                  'Start from',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                size.width(8),
                                Row(
                                  children: [
                                    size.width(8),
                                    const Icon(Icons.date_range_rounded,
                                        size: 16, color: ColorsClass.date),
                                    size.width(4),
                                    Text(
                                      '10/06 To 11/06',
                                      style: TextStyle(
                                          color: ColorsClass.date,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        // Reminder Button
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 241, 248),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.alarm,
                                  color: Colors.blue, size: 16),
                              size.width(4),
                              Text(
                                'Reminder',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    size.height(25), // Info Section
                    Text(
                      'Info',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: ColorsClass.homeCardText,
                      ),
                    ),
                    size.height(10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people,
                                color: ColorsClass.date, size: 20.sp),
                            const SizedBox(width: 4),
                            Text(
                              '2 members on this task',
                              style: TextStyle(
                                  color: ColorsClass.date,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                        size.width(10),
                        Row(
                          children: [
                            Icon(CupertinoIcons.chat_bubble_text,
                                color: ColorsClass.date, size: 20.sp),
                            const SizedBox(width: 4),
                            Text(
                              '8 comments',
                              style: TextStyle(
                                  color: ColorsClass.date,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    size.height(15),
                    const Row(
                      children: [
                        Icon(
                          CupertinoIcons.timer,
                          color: ColorsClass.date,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'In Progress',
                          style: TextStyle(
                            color: ColorsClass.date,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: ColorsClass.date,
                          size: 20,
                        ),
                      ],
                    ),

                    size.height(25),
                    // Progress Bar
                    Text(
                      '24% complete',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: ColorsClass.homeCardText,
                      ),
                    ),
                    size.height(8),
                    LinearProgressIndicator(
                      value: 0.24,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              size.height(40)
            ],
          ),
        ),
      ],
    );
  }
}
