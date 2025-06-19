import 'package:gradution_project/Core/Imports/common_imports.dart';

class Card1Widget extends StatelessWidget {
  const Card1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 20), // Margin around the card
      padding: const EdgeInsets.all(8), // Padding inside the card
      decoration: BoxDecoration(
        border: Border.all(color: ColorsClass.lightGrey, width: 2),
        // color: Colors.white, // Card background color
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left part with the icon and text
          Column(
            children: [
              // Green star icon in a circle
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                          .withOpacity(0.1), // Light green background
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 30, // Icon size
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Task Completed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  size.width(60),
                  Text(
                    '08',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250.w,
                  height: 1.h,
                  color: ColorsClass.lightGrey,
                ),
              ),
              size.height(10),
              // ignore: prefer_const_constructors
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        width: 160.w, height: 150.h, child: LineChartWidget()),
                  ),
                  size.width(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      size.height(50),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '10+',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' more',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors
                                    .grey, // Example: you can change color or style for "more"
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'from last week',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Right part with the additional info
        ],
      ),
    );
  }
}
