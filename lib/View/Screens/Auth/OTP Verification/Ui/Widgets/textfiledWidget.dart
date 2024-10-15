import 'package:flutter/material.dart';
import 'package:project_graduation/core/Theming/colors/colors.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget({super.key, required this.controller, required this.label, required this.onChanged});

  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.widthMedia(context, .15),
      color: ColorsClass.colorwhite,
      child: TextFormField(
       // autofocus: true,
        controller: controller,
        maxLength: 1,
        cursorColor: ColorsClass.primary,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            color: ColorsClass.text, fontWeight: FontWeight.bold, fontSize: 20),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: ColorsClass.primary),
          counterText: '',
          hintStyle: TextStyle(color: ColorsClass.text.withOpacity(0.5)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsClass.primary, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsClass.primary, width: 2),
         
          ),
          
        ),
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        
      ),
    );
  }
}
