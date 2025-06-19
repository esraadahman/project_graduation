import 'package:gradution_project/Core/Imports/common_imports.dart';

part 'switch_lang_state.dart';

class SwitchLangCubit extends Cubit<SwitchLangState> {
  SwitchLangCubit() : super(SwitchLangInitial()) {
    initializeLanguage();
  }

  final Box settingsBox = Hive.box(HiveConstants.Boxname);

  void initializeLanguage() {
    String? lang = settingsBox.get('lang');
    if (lang != null) {
      emit(AppChangeLanguage(languageCode: lang));
    }
  }

  void switchToArabic() {
    settingsBox.put('lang', 'ar');
    emit(AppChangeLanguage(languageCode: 'ar'));
  }

  void switchToEnglish() {
    settingsBox.put('lang', 'en');
    emit(AppChangeLanguage(languageCode: 'en'));
  }

 
}
