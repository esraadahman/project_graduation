import 'package:project_graduation/Core/Imports/common_imports.dart';

class PhoneNumberField extends StatelessWidget {
  PhoneNumberField({super.key, this.controller});

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width(context) / 1.2 / 20,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LangClass.translate(context, 'phoneNumber'),
              style: TextStyle(
                  fontSize: width(context) / 30,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.sub_text),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width(context) / 1.2 / 20,
          ),
          child: Container(
            height: height(context) * .07,
            child: IntlPhoneField(
              decoration: InputDecoration(
                hintText: LangClass.translate(context, 'enterPhone'),
                hintStyle: styling.subtitle.copyWith(
                    color: ColorsClass.border_color,
                    fontSize: width(context) / 36,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: ColorsClass.sub_text, width: 1)),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber); // Prints the complete phone number
              },
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}
