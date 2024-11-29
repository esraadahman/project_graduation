import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/fonts/fonts.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';

class DeadlineInput extends StatefulWidget {
  final TextEditingController controller;

  DeadlineInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _DeadlineInputState createState() => _DeadlineInputState();
}

class _DeadlineInputState extends State<DeadlineInput> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.9,
      margin: EdgeInsets.only(
          left: width(context) * .05, right: width(context) * .05),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Deadline",
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(10),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: ColorsClass.border_color, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: ColorsClass.border_color, width: 1)),
              labelText: 'Choose your project deadline ',
              labelStyle: styling.subtitle.copyWith(
                  color: ColorsClass.password_text,
                  fontSize: width(context) / 30,
                  fontWeight: FontWeight.normal),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.date_range_outlined,
                  color: ColorsClass.password_text,
                  size: width(context) / 14,
                ),
                onPressed: () => _selectDate(context),
              ),
              border: OutlineInputBorder(),
            ),
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
