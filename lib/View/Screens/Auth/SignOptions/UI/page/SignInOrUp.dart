import 'package:project_graduation/Core/Imports/common_imports.dart';

class SignInOrUpOption extends StatelessWidget {
  const SignInOrUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) / 60),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            size.height(height(context) / 14),
            Row(
              children: [
                size.width(width(context) <= 390
                    ? width(context) / 1000
                    : width(context) / 11),
                Spacer(),
                LanguageIcon(),
              ],
            ),
            size.height(height(context) / 9),
            Image(
              image: const AssetImage("assets/images/Logo (1) (2).png"),
              width: width(context) / 2,
              height: height(context) / 5,
            ),
            const SizedBox(height: 48),

            // Login Button
            SizedBox(
              width: width(context) / 1.1, // Adjust width as needed
              height: height(context) / 17, // Adjust height as needed
              child: ElevatedButton(
                onPressed: () {
                  context.navigateTo(const SignInScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsClass.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // Button color
                ),
                child: Text(
                  LangClass.translate(context, 'login'),
                  style: styling.maintitle.copyWith(
                    fontSize: width(context) / 25,
                    color: ColorsClass.colorwhite,
                  ),
                ),
              ),
            ),
            size.height(16),

            // Sign up button
            SizedBox(
              width: width(context) / 1.1, // Adjust width as needed
              height: height(context) / 17, // Adjust height as needed
              child: OutlinedButton(
                onPressed: () {
                  context.navigateTo(SignUpScreen());
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: ColorsClass.lightGrey),
                ),
                child: Text(LangClass.translate(context, 'signup'),
                    style: styling.maintitle.copyWith(
                        fontSize: width(context) / 25,
                        color: ColorsClass.primary,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: height(context) / 15),

            SizedBox(
                width: width(context) / 1.1, // Adjust width as needed
                //      height: height(context) / 7,
                child:
                    ORWithWidget(text: "Or continue with",ontap1: () {}, ontap2: () {}, ontap3: () {})),
            const SizedBox(height: 32),

            // Continue as guest
            TextButton(
              onPressed: () {
                // Guest login
              },
              child: Text(LangClass.translate(context, 'asguest'),
                  style: styling.maintitle.copyWith(
                    fontSize: width(context) / 25,
                    color: ColorsClass.primary,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
