import 'package:gradution_project/Core/Imports/common_imports.dart';

class AppLoalization {
  Locale? locale;
  AppLoalization({this.locale});

  static AppLoalization? of(BuildContext context) {
    return Localizations.of<AppLoalization>(context, AppLoalization);
  }

  static LocalizationsDelegate<AppLoalization> delegate =
      _AppLoalizationDelegate();

// same function to read languages files
  late Map<String, String> jsonString;

  Future LoadLanguage() async {
    String translation = await rootBundle
        .loadString(('assets/Localization/${locale!.languageCode}.json'));

    Map<String, dynamic> lang = json.decode(translation);
    jsonString = lang.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => jsonString[key] ?? '';
}

class _AppLoalizationDelegate extends LocalizationsDelegate<AppLoalization> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLoalization> load(Locale locale) async {
    AppLoalization appLoalization = AppLoalization(locale: locale);
    await appLoalization.LoadLanguage();
    return appLoalization;
  }

// return localization when reload app true or false
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLoalization> old) =>
      false;
}
