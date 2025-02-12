import 'package:project_graduation/Core/Imports/common_imports.dart';


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
                width: width(context) / 3,
                height: height(context) / 5,
              )),
          Positioned(
              bottom: height(context) >= 1080
                  ? height(context) / 2.5
                  : height(context) / 3.1,
              left: 0,
              child: Padding(
                padding:
                    //    EdgeInsets.symmetric(vertical: height(context)/20, horizontal:  width(context)/45),
                    EdgeInsets.only(
                        left: width(context) / 48, right: width(context) / 45),
                child: Text(titles[index],
                    style: styling.subtitle.copyWith(
                        fontSize: width(context) / 15,
                        color: ColorsClass.colorwhite,
                        fontWeight: FontWeight.bold)),
              )),
          Positioned(
            bottom: height(context) >= 1080
                ? height(context) / 4
                : height(context) / 4.5,
            left: 0,
            child: SizedBox(
              width: width(context),
              child: Padding(
                padding:
                    //  EdgeInsets.symmetric(
                    //     vertical: height(context) / 180,
                    //     horizontal: width(context) / 27),
                    EdgeInsets.only(
                  left: width(context) / 25,
                  right: width(context) / 45,
                ),
                child: Text(descriptions[index],
                    textAlign: TextAlign.left,
                    style: styling.subtitle.copyWith(
                        fontSize: width(context) / 21,
                        color: const Color.fromARGB(255, 247, 248, 249),
                        fontWeight: FontWeight.normal)),
              ),
            ),
          ),
          Positioned(
            bottom: width(context) < 800
                ? height(context) / 8.5
                : height(context) / 6.7,
            left: width(context) / 25,
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
              bottom: width(context) < 800
                  ? height(context) / 43
                  : height(context) / 37,
              left: width(context) / 24,
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30, bottom: 30, right: 30),
                  child: InkWell(
                      onTap: () {
                        context.navigateTo(const SignInOrUpOption());
                      },
                      child: SizedBox(
                          width: 60.w,
                          child: Text("Skip",
                              style: styling.subtitle.copyWith(
                                  fontSize: width(context) / 21,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsClass.colorwhite)))))),
          Positioned(
            bottom: height(context) / 20,
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
                      width: width(context) / 5,
                      height: width(context) / 5,
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
                      width: width(context) / 7.3,
                      height: width(context) / 7.3,
                      decoration: BoxDecoration(
                          gradient: ColorsClass.appGradient,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorsClass.colorwhite,
                            size: width(context) / 15,
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
