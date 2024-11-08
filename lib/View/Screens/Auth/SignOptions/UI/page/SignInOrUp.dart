import 'package:project_graduation/Core/Imports/common_imports.dart';

class SignInOrUpOption extends StatelessWidget {
  const SignInOrUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              size.height(10),

              LanguageIcon(),

              size.height(50),
              Image.asset("assets/images/Logo (1).png"),
              const SizedBox(height: 48),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  context.navigateTo(const SignInScreen());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: ColorsClass.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // Button color
                ),
                child: Text(
                  LangClass.translate(context, 'login'),
                  style:
                      TextStyle(fontSize: 18.sp, color: ColorsClass.colorwhite),
                ),
              ),
              size.height(16),

              // Sign up button
              OutlinedButton(
                onPressed: () {
                  context.navigateTo( SignUpScreen());
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: ColorsClass.lightGrey),
                ),
                child: Text(
                  LangClass.translate(context, 'signup'),
                  style: const TextStyle(
                      fontSize: 18,
                      color: ColorsClass.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),

              ORWithWidget(ontap1: () {}, ontap2: () {}, ontap3: () {}),
              const SizedBox(height: 32),

              // Continue as guest
              TextButton(
                onPressed: () {
                  // Guest login
                },
                child: Text(
                  LangClass.translate(context, 'asguest'),
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorsClass.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
