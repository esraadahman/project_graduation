import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Page/login-succes.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Page/otp_verification.dart';
import 'package:project_graduation/View/Screens/Auth/School_or_company/page/school_or_company.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/page/sign_in.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20up/page/sign_up.dart';
import 'package:project_graduation/View/Screens/Auth/change_pass_correct/Page/change_pass_correct.dart';
import 'package:project_graduation/View/Screens/Auth/createAccountSuccessfully/page/create_account_succefully.dart';

void main()async {
  
   runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), 
  ),
);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
       designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        //  localizationsDelegates: [
        //         //S.delegate,
        //         GlobalMaterialLocalizations.delegate,
        //         GlobalWidgetsLocalizations.delegate,
        //         GlobalCupertinoLocalizations.delegate,
        //     ],
           // supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
      
     // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        home:SignUpScreen(),
    //   home:JoinScreen()
      ),
    );

  }
}
