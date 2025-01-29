import 'package:project_graduation/CubitForLanguage/cubit/switch_lang_cubit.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class LanguageIcon extends StatelessWidget {
  LanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final Box settingsBox = Hive.box(HiveConstants.Boxname);
    String lang = settingsBox.get('lang').toString().toUpperCase();
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
             //   lang == null? state.languageCode : lang,
            lang,
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
