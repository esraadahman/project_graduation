import 'package:gradution_project/Core/Imports/common_imports.dart';

class Radiobutton extends StatefulWidget {
  final Function(String) onStageSelected;
  const Radiobutton({super.key, required this.onStageSelected});

  @override
  State<Radiobutton> createState() => _RadiobuttonState();
}

class _RadiobuttonState extends State<Radiobutton> {
  String _selectedOption = 'planning';

  final List<String> _stages = [
    'planning',
    'research',
    'development',
    'review',
    'finalization',
  ];

  Widget _buildRadioTile(String title) {
    return RadioListTile<String>(
      title: Text(
        title[0].toUpperCase() +
            title.substring(1), 
        style: styling.maintitle
            .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      value: title,
      groupValue: _selectedOption,
      onChanged: (value) {
        setState(() {
          _selectedOption = value!;
        });
        widget.onStageSelected(value!);
      },
      contentPadding: EdgeInsets.zero,
      activeColor: ColorsClass.onBoard,
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: width(context) * .05, right: width(context) * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Project's Current Stage",
              style: styling.subtitle
                  .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          const SizedBox(height: 16),
          ..._stages.map(_buildRadioTile).toList(),
        ],
      ),
    );
  }
}
