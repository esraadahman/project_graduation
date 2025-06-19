import 'package:gradution_project/Core/Imports/common_imports.dart';

class CardNextTasks extends StatelessWidget {
  const CardNextTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      size.width(8),
                      Row(
                        children: [
                          size.width(8),
                          SvgPicture.asset(
                            "assets/images/stash_user-group.svg",
                            height: 24.0,
                          ),
                          size.width(2),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 241, 248),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/Vector (1).svg",
                      height: 20.0,
                    ),
                    size.width(5),
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
                  SvgPicture.asset(
                    "assets/images/stash_user-group (1).svg",
                    height: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text('2 members on this task',
                      style: styling.subtitle.copyWith(
                          color: ColorsClass.date,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.sp)),
                ],
              ),
              size.width(16),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/stash_user-group (2).svg",
                    height: 24.0,
                  ),
                  size.width(4),
                  Text(
                    '8 comments',
                    style: styling.subtitle.copyWith(
                        color: ColorsClass.date,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
          size.height(15),
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/mdi_list-status.svg",
                height: 24.0,
              ),
              size.width(4),
              Text('In Progress',
                  style: styling.subtitle.copyWith(
                      color: ColorsClass.date,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp)),
              size.width(4),
              const Icon(
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
    );
  }
}
