import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_graduation/Core/Language/applocalization.dart';
import 'package:project_graduation/Core/hive_constants/hive_constants.dart';
import 'package:project_graduation/CubitForLanguage/cubit/switch_lang_cubit.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Page/otp_verification.dart';
import 'package:project_graduation/View/Screens/Auth/SignOptions/UI/page/SignInOrUp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_graduation/View/Screens/Home/UI/pages/Home.dart';
import 'package:project_graduation/View/Screens/Home/UI/pages/Navi.dart';
import 'package:project_graduation/View/Screens/onBoarding/UI/page/onboarding.dart';
import 'package:project_graduation/View/Screens/workSpaces/Ui/page/workSpaces.dart';
import 'package:project_graduation/View/Screens/workSpaces/Ui/widget/bottomBar.dart';

void main() async {
  await Hive.initFlutter();
  // open box
  await Hive.openBox(HiveConstants.Boxname);

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
    return BlocProvider(
      create: (context) => SwitchLangCubit(),
      child: BlocBuilder<SwitchLangCubit, SwitchLangState>(
        builder: (context, state) {
          if (state is AppChangeLanguage) {
            String local = state.languageCode;
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp(
                  locale: Locale(local),
                  debugShowCheckedModeBanner: false,
                  supportedLocales: [const Locale('en'), const Locale('ar')],
                  // need package to make app fit duration of language in mobile
                  localizationsDelegates: [
                    AppLoalization.delegate,
                    // make app fit duration of language in mobile
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  // make app fit language of mobile
                  localeResolutionCallback: (deviceLocal, supportedLocales) {
                    for (var local in supportedLocales) {
                      // if language of mobile has been choosen
                      if (deviceLocal != null) {
                        //  if language of mobile == language that selected in loop make language of app like language of mobile
                        if (deviceLocal.languageCode == local.languageCode) {
                          return deviceLocal;
                        }
                      }
                    }
                    // if language of mobile not suported in my app choose first language in json files
                    return supportedLocales.first;
                  },
                  builder: DevicePreview.appBuilder,
                  home:
                       // OnBoardingScreen()
                      //   Scaffold(
                      //   backgroundColor: Colors.white,
                      //   body: OnboardScreen(),
                      // ),
                      //   const SignInOrUpOption(),
                      //   Workspaces()
                    //  NumberPageIndicatorExample()
                   NaviBar()
                  //     HomeContent()
                  // SignUpScreen(),
                  //   home:JoinScreen()
                  ),
            );
          }
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              supportedLocales: [const Locale('en'), const Locale('ar')],
              // need package to make app fit duration of language in mobile
              localizationsDelegates: [
                AppLoalization.delegate,
                // make app fit duration of language in mobile
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              // make app fit language of mobile
              localeResolutionCallback: (deviceLocal, supportedLocales) {
                for (var local in supportedLocales) {
                  // if language of mobile has been choosen
                  if (deviceLocal != null) {
                    //  if language of mobile == language that selected in loop make language of app like language of mobile
                    if (deviceLocal.languageCode == local.languageCode) {
                      return deviceLocal;
                    }
                  }
                }
                // if language of mobile not suported in my app choose first language in json files
                return supportedLocales.first;
              },

              builder: DevicePreview.appBuilder,
              home:
                  //OnBoardingScreen()
                  //   Scaffold(
                  //   backgroundColor: Colors.white,
                  //   body: OnboardScreen(),
                  // ),
                  const SignInOrUpOption(),
              //NaviBar()
              // SignUpScreen(),
              //   home:JoinScreen()
            ),
          );
        },
      ),
    );
  }
}
