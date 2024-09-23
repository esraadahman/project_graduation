import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';

class GradientCheckBoxWidget extends StatefulWidget {
  const GradientCheckBoxWidget({super.key ,required this.text});
  final String text;

  @override
  State<GradientCheckBoxWidget> createState() => _GradientCheckBoxWidgetState();
}

class _GradientCheckBoxWidgetState extends State<GradientCheckBoxWidget> {
  bool _isChecked =false;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            child: Row(
              
              children: [
                size.width(15),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                    gradient: _isChecked
                        ? ColorsClass.appGradient // Use gradient when checked
                        : null, // No gradient when unchecked
                    border: Border.all(
                      color: Colors.grey.shade400, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: _isChecked
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )
                      : null, // Show checkmark if checked
                ),
                SizedBox(width: 8),
                 Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
  }
}