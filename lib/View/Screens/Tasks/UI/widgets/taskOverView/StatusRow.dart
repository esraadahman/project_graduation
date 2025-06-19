import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class StatusRow extends StatefulWidget {
  const StatusRow({
    super.key,
    required this.items,
    this.onChanged,
    required this.initialValue,
    required this.onclick,
  });

  /// The list of status strings to display
  final List<String> items;

  /// Callback when a new status is selected
  final ValueChanged<String?>? onChanged;

  /// Initial selected status; must match one of [items]
  final String initialValue;

  /// Callback for the action icon
  final VoidCallback onclick;

  @override
  State<StatusRow> createState() => _StatusRowState();
}

class _StatusRowState extends State<StatusRow> {
  late List<String> _uniqueItems;
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    // Remove duplicates and preserve order
    _uniqueItems = widget.items.toSet().toList();
    // Ensure initialValue is valid
    if (_uniqueItems.contains(widget.initialValue)) {
      selectedValue = widget.initialValue;
    } else if (_uniqueItems.isNotEmpty) {
      selectedValue = _uniqueItems.first;
    } else {
      selectedValue = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dropdown for status
        Container(
          width: 120,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
          decoration: BoxDecoration(
            color: ColorsClass.customBlueTransparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue.isEmpty ? null : selectedValue,
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Colors.blue,
              ),
              dropdownColor: ColorsClass.background,
              borderRadius: BorderRadius.circular(15),
              items: _uniqueItems.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value[0].toUpperCase() + value.substring(1),
                    style: styling.subtitle.copyWith(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue == null) return;
                setState(() {
                  selectedValue = newValue;
                });
                widget.onChanged?.call(newValue);
              },
            ),
          ),
        ),
        // Icon button
        GestureDetector(
          onTap: widget.onclick,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsClass.delete,
            ),
            width: 40,
            height: 40,
            child: Icon(
              CupertinoIcons.delete,
              color: ColorsClass.errorcolor,
            ),
          ),
        ),
      ],
    );
  }
}
