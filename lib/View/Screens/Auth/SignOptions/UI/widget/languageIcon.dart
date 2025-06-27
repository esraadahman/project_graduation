import 'package:gradution_project/MainCubites/CubitForLanguage/cubit/switch_lang_cubit.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class LanguageIcon extends StatelessWidget {
  const LanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
      final Box settingsBox = Hive.box(HiveConstants.Boxname);
    final Locale deviceLocale = Localizations.localeOf(context);

    final String? storedLang = settingsBox.get('lang');
    final String langCode = storedLang?.toUpperCase() ?? deviceLocale.languageCode.toUpperCase();

    return Row(
      children: [
        const SizedBox(width: 290),
        PopupMenuButton<String>(
          onSelected: (String language) {
            // Implement your language switch logic here
            if (language == "EN") {
              context.read<SwitchLangCubit>().switchToEnglish();
            } else if (language == "AR") {
              context.read<SwitchLangCubit>().switchToArabic();
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'EN',
              child: Text('English'),
            ),
            const PopupMenuItem<String>(
              value: 'AR',
              child: Text('Arabic'),
            ),
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.language,
                color: ColorsClass.primary,
                size: width(context) / 15,
              ),
              const SizedBox(width: 5),
              Text(
                langCode,
                style: styling.maintitle.copyWith(
                    fontSize: width(context) / 17, color: ColorsClass.primary),
              )
            ],
          ),
        ),
      ],
    );
  }
}
