import 'package:project_graduation/Core/Imports/common_imports.dart';

class PhoneNumberField extends StatelessWidget {
   PhoneNumberField({super.key, this.controller});

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LangClass.translate(context, 'phoneNumber'),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.sub_text),
            ),
          ),
        ),
        Padding(
          padding:  const EdgeInsets.only(left: 15.0, right: 15),
          child: IntlPhoneField(
            decoration: InputDecoration(
              hintText:  LangClass.translate(context, 'enterPhone'),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                       const BorderSide(color: ColorsClass.sub_text, width: 1)),
            ),
            initialCountryCode: 'US',
            onChanged: (phone) {
              print(phone.completeNumber); // Prints the complete phone number
            },
            controller: controller,
          ),
        ),
      ],
    );
  }
}
