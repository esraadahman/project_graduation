import 'package:gradution_project/Core/Imports/common_imports.dart';


class ProfilePhoneNumberField extends StatelessWidget {
  ProfilePhoneNumberField({super.key, this.controller});

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  const EdgeInsets.only(bottom: 10),
          
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LangClass.translate(context, 'phoneNumber'),
              style: styling.maintitle.copyWith(
                color: ColorsClass.sub_text,
                fontSize: 17,
                fontWeight: FontWeight.normal,
            )),
          ),
        ),
        Container(
          height: 70,
          child: IntlPhoneField(
            decoration: InputDecoration(
              hintText: LangClass.translate(context, 'enterPhone'),
              hintStyle: styling.subtitle.copyWith(
                  color: ColorsClass.sub_text,
                  fontSize: width(context) / 25,
                  fontWeight: FontWeight.normal),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: ColorsClass.lightGrey, width: 1),
              ),
            
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: ColorsClass.lightGrey, width: 1)),
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
