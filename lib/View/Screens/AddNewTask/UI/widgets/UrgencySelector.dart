import 'package:gradution_project/Core/Imports/common_imports.dart';

class UrgencySelector extends StatefulWidget {
  /// Callback when user selects an urgency level
  final Function(String) onUrgencySelected;
  /// Initial urgency value; if null or not in levels, defaults to 'Urgent'
  final String? initialUrgency;

  const UrgencySelector({
    super.key,
    required this.onUrgencySelected,
    this.initialUrgency,
  });

  @override
  State<UrgencySelector> createState() => _UrgencySelectorState();
}

class _UrgencySelectorState extends State<UrgencySelector> {
  late String _selectedUrgency;

  final List<String> _urgencyLevels = [
    'Urgent',
    'Normal',
    'Later',
  ];

  @override
  void initState() {
    super.initState();
    // Use provided initialUrgency if valid; otherwise default to 'Urgent'
    if (widget.initialUrgency != null &&
        _urgencyLevels.contains(widget.initialUrgency)) {
      _selectedUrgency = widget.initialUrgency!;
    } else {
      _selectedUrgency = 'Urgent';
    }
    // Notify parent of initial urgency
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onUrgencySelected(_selectedUrgency);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Urgency Level",
          style: styling.subtitle.copyWith(
            color: ColorsClass.password_text,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _urgencyLevels.map((level) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: level,
                  groupValue: _selectedUrgency,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedUrgency = value;
                    });
                    widget.onUrgencySelected(value);
                  },
                  activeColor: ColorsClass.onBoard,
                ),
                Text(
                  level,
                  style: styling.subtitle.copyWith(
                    color: ColorsClass.password_text,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
