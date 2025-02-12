import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/Core/Language/applocalization.dart';
import 'package:project_graduation/Core/Notifications/services/push_notifications_service.dart';
import 'package:project_graduation/Core/api/endPointes.dart';
import 'package:project_graduation/Core/hive_constants/hive_constants.dart';
import 'package:project_graduation/CubitForLanguage/cubit/switch_lang_cubit.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/page/Basics.dart';
import 'package:project_graduation/View/Screens/Auth/SignOptions/UI/page/SignInOrUp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_graduation/View/Screens/Home/UI/pages/Navi.dart';
import 'package:project_graduation/View/Screens/WorkSpace/Ui/page/workspace.dart';
import 'package:project_graduation/View/Screens/onBoarding/UI/page/onboarding.dart';
import 'package:project_graduation/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotificationsService.init();
  await Hive.initFlutter();
  // open box
  await Hive.openBox(HiveConstants.Boxname);
  await Hive.openBox(HiveConstants.boxName);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final Box box = Hive.box(HiveConstants.Boxname);
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
                      //OnBoardingScreen()
                      //   OTP_Verification()
                      //   Scaffold(
                      //   backgroundColor: Colors.white,
                      //   body: OnboardScreen(),
                      // ),
                      //   const SignInOrUpOption(),
                      //  Workspaces()
                      //  NumberPageIndicatorExample()
                      //  NaviBar()
                      //  BasicsScreen(),
                      //  BasicsScreen()
                      // SchoolAccountScreen()
                      //    HomeContent()
                      box.get(ApiKey.token, defaultValue: "") != null
                          ? NaviBar()
                          : SignUpScreen(),
                //    Workspace()
                  //   home:JoinScreen()
                  //  CreateNewPass()
                  //  ChangePassCorrect()
                  //CreateAccountSuccefully()
                  //  SchoolOrCompany()
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
                home: OnBoardingScreen()
                //   Scaffold(
                //   backgroundColor: Colors.white,
                //   body: OnboardScreen(),
                // ),
                //  const SignInOrUpOption(),
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
