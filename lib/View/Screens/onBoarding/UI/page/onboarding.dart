import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/onBoarding/UI/widget/CustomIndicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingBackgroundState();
}

class _OnBoardingBackgroundState extends State<OnBoardingScreen> {
  int index = 0;
  bool isOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: width(context),
              height: height(context),
              child: Image.asset(
                "assets/images/onboarding.jpeg",
                fit: BoxFit.cover,
              )),
          Container(
            width: width(context),
            height: height(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsClass.colorwhite.withOpacity(0.5),
                  const Color(0xFF003268).withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
              left: 15,
              top: 30,
              child: Image(
                image: const AssetImage("assets/images/Logo (1).png"),
                width: 100.w,
                height: 100.h,
              )),
          Positioned(
              bottom: 270,
              left: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  titles[index],
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: ColorsClass.colorwhite,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
            bottom: 170,
            left: 0,
            child: SizedBox(
              width: width(context),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  descriptions[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 247, 248, 249),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: index == 0),
                const SizedBox(width: 5),
                CustomIndicator(active: index == 1),
                const SizedBox(width: 5),
                CustomIndicator(active: index == 2),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              left: 3,
              child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: InkWell(
                      onTap: () {
                        context.navigateTo(const SignInOrUpOption());
                      },
                      child: SizedBox(
                          width: 60.w,
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 17.5.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsClass.colorwhite),
                          ))))),
          Positioned(
            bottom: 40,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: 200.0),
              child: Positioned(
                bottom: 50,
                right: 20,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circular progress indicator
                    SizedBox(
                      width: 70.w,
                      height: 70.w,
                      child: CircularProgressIndicator(
                        value: (index + 1) / 3, // Update the progress
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            ColorsClass.light_gradient),
                        strokeWidth: 4,
                      ),
                    ),
                    // Button in the center of the circular indicator
                    Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          gradient: ColorsClass.appGradient,
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorsClass.colorwhite,
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            Timer(const Duration(milliseconds: 300), () {
                              setState(() {
                                if (index >= 2) {
                                  // Navigate to SignInOrUpOption if this is the last screen
                                  context.navigateTo(const SignInOrUpOption());
                                } else {
                                  // Increment the index to move to the next screen
                                  index++;
                                }
                              });
                            });
                            // onPressed: () {
                            //   if (_currentPage < 2) {
                            //     // Move to the next screen
                            //     _pageController.nextPage(
                            //       duration: Duration(milliseconds: 300),
                            //       curve: Curves.easeIn,
                            //     );
                            //   } else {
                            //     // Do something when the last screen is reached
                            //   }
                            // },
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
