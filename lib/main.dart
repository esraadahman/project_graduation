import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  // open box
  await Hive.openBox(HiveConstants.Boxname);
  await Hive.openBox(HiveConstants.boxName);
  PushNotificationsService.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchLangCubit()),
        BlocProvider(create: (_) => ThemeCubit()), 
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
static final Box box = Hive.box(HiveConstants.Boxname);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<SwitchLangCubit, SwitchLangState>(
          builder: (context, state) {
            final locale =
                state is AppChangeLanguage ? Locale(state.languageCode) : null;

            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp(
                themeMode: themeMode,
                theme: Themes.lightTheme,
                darkTheme: Themes.darkTheme,
                locale: locale,
                debugShowCheckedModeBanner: false,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: [
                  AppLoalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var local in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == local.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                builder: DevicePreview.appBuilder,
                home: box.get(ApiKey.token) != null
                    ? const NaviBar()
                    : const OnBoardingScreen(),
                //     const Task(
                //   taskname: "Task name",
                //   title: "Project X dashboard UI design",
                //   status: "Ongoing",
                //   deadline: '2024-01-01',
                //   description: "Design the dashboard for Project X.",
                // )
                // const NaviBar(),
              ),
            );
          },
        );
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   static final Box box = Hive.box(HiveConstants.Boxname);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SwitchLangCubit(),
//       child: BlocBuilder<SwitchLangCubit, SwitchLangState>(
//         builder: (context, state) {
//           if (state is AppChangeLanguage) {
//             String local = state.languageCode;
//             return ScreenUtilInit(
//               designSize: const Size(360, 690),
//               minTextAdapt: true,
//               splitScreenMode: true,
//               child: MaterialApp(
//                 themeMode: ThemeMode.system,
//                 darkTheme: Themes.darkTheme,
//                 // ** the defult for light  **
//                 theme: Themes.lightTheme,
//                 locale: Locale(local),
//                 debugShowCheckedModeBanner: false,
//                 supportedLocales: [const Locale('en'), const Locale('ar')],
//                 // need package to make app fit duration of language in mobile
//                 localizationsDelegates: [
//                   AppLoalization.delegate,
//                   // make app fit duration of language in mobile
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   GlobalCupertinoLocalizations.delegate
//                 ],
//                 // make app fit language of mobile
//                 localeResolutionCallback: (deviceLocal, supportedLocales) {
//                   for (var local in supportedLocales) {
//                     // if language of mobile has been choosen
//                     if (deviceLocal != null) {
//                       //  if language of mobile == language that selected in loop make language of app like language of mobile
//                       if (deviceLocal.languageCode == local.languageCode) {
//                         return deviceLocal;
//                       }
//                     }
//                   }
//                   // if language of mobile not suported in my app choose first language in json files
//                   return supportedLocales.first;
//                 },
//                 builder: DevicePreview.appBuilder,
//                 home: OnBoardingScreen(),
//               ),
//             );
//           }
//           return ScreenUtilInit(
//             designSize: const Size(360, 690),
//             minTextAdapt: true,
//             splitScreenMode: true,
//             child: MaterialApp(
//                 themeMode: ThemeMode.system,
//                 darkTheme: Themes.darkTheme,
//                 // ** the defult for light  **
//                 theme: Themes.lightTheme,
//               debugShowCheckedModeBanner: false,
//               supportedLocales: [const Locale('en'), const Locale('ar')],
//               // need package to make app fit duration of language in mobile
//               localizationsDelegates: [
//                 AppLoalization.delegate,
//                 // make app fit duration of language in mobile
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate
//               ],
//               // make app fit language of mobile
//               localeResolutionCallback: (deviceLocal, supportedLocales) {
//                 for (var local in supportedLocales) {
//                   // if language of mobile has been choosen
//                   if (deviceLocal != null) {
//                     //  if language of mobile == language that selected in loop make language of app like language of mobile
//                     if (deviceLocal.languageCode == local.languageCode) {
//                       return deviceLocal;
//                     }
//                   }
//                 }
//                 // if language of mobile not suported in my app choose first language in json files
//                 return supportedLocales.first;
//               },
//               builder: DevicePreview.appBuilder,
//               home: box.get(ApiKey.token) != null ? NaviBar() : SignUpScreen(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
