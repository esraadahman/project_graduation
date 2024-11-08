import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:project_graduation/Core/hive_constants/hive_constants.dart';

part 'switch_lang_state.dart';

class SwitchLangCubit extends Cubit<SwitchLangState> {
 SwitchLangCubit() : super(SwitchLangInitial()){
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
