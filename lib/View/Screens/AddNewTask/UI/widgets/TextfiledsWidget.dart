
import 'package:gradution_project/Core/Imports/common_imports.dart';


class Textfiledswidget extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String description;
  String urgencyLevel;
  String deadline;
  bool iupdate;
  String buttonText;
  final TextEditingController? controller;
  final List<String> items;
  final void Function({
    required String title,
    required int assignedMember,
    required String urgencyLevel,
    required String description,
    required String deadline,
  }) onNext;

  Textfiledswidget({
    Key? key,
    required this.labelText,
    this.hintText = "",
    this.controller,
    this.urgencyLevel = '',
    this.deadline = "",
    required this.items,
    required this.onNext,
    required this.description,
    required this.iupdate,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<Textfiledswidget> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<Textfiledswidget> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _deadlineController;
  // String _urgencyLevel = 'Urgent';
  String? _selectedMember;

// to sure it all has data
  bool _showTitleError = false;
  bool _showMemberError = false;
  bool _showDescriptionError = false;
  bool _showDeadlineError = false;
  void _submitForm() {
    setState(() {
      _showTitleError = _titleController.text.isEmpty;
      _showMemberError = _selectedMember == null || _selectedMember!.isEmpty;
      _showDescriptionError = _descriptionController.text.isEmpty;
      _showDeadlineError = _deadlineController.text.isEmpty;
    });

    final hasError = _showTitleError ||
        _showMemberError ||
        _showDescriptionError ||
        _showDeadlineError;

    if (!hasError) {
      widget.onNext(
        title: _titleController.text,
        assignedMember: 5,
        urgencyLevel:
            widget.urgencyLevel == '' ? 'Urgent' : widget.urgencyLevel,
        description: _descriptionController.text,
        deadline: _deadlineController.text,
      );
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _deadlineController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _deadlineController = TextEditingController(
      text: widget.iupdate ? widget.deadline ?? "" : null,
    );
    _descriptionController = TextEditingController(
        text: widget.iupdate ? widget.description ?? "" : null);
    _titleController = TextEditingController(
        text: widget.iupdate ? widget.hintText ?? "" : null);

for (var item in widget.items) {
    print("Item: $item");
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
            child: Text(widget.labelText,
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(5),
          SizedBox(
            width: width(context),
            height: height(context) * .07,
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: _showTitleError
                              ? Colors.red
                              : ColorsClass.border_color,
                          width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: _showTitleError
                              ? Colors.red
                              : ColorsClass.border_color,
                          width: 1)),
                  hintText: widget.hintText,
                  hintStyle: styling.subtitle.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: _showTitleError ? Colors.red : ColorsClass.sub_text,
                  )),
              controller: _titleController,
            ),
          ),
          size.height(40),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Assigned  Members",
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(5),
          SizedBox(
            width: width(context),
            height: height(context) * 0.07,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: _showMemberError
                        ? Colors.red
                        : ColorsClass.border_color,
                    width: 1.0),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: _selectedMember,
                  borderRadius: BorderRadius.circular(10),
                  icon: Transform.rotate(
                    angle: 4.7124, // Rotate the icon to point down
                    child: Icon(Icons.arrow_back_ios_new,
                        color:
                            _showMemberError ? Colors.red : ColorsClass.text),
                  ),
                  isExpanded: true,
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose assigned members to this task',
                        style: styling.subtitle.copyWith(
                          fontWeight: FontWeight.normal,
                          color: _showMemberError
                              ? Colors.red
                              : ColorsClass.sub_text,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedMember = newValue;
                    });
                  },
                  underline: const SizedBox(),
                  items: widget.items
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: styling.subtitle.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          size.height(30),
          UrgencySelector(
            initialUrgency:
                widget.urgencyLevel.isEmpty ? null : widget.urgencyLevel,
            onUrgencySelected: (value) {
              print(value);
              widget.urgencyLevel = value;
            },
          ),
          size.height(40),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Description",
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(5),
          SizedBox(
            width: width(context),
            height: height(context) * .25,
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: _showDescriptionError
                              ? Colors.red
                              : ColorsClass.border_color,
                          width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: _showDescriptionError
                              ? Colors.red
                              : ColorsClass.border_color,
                          width: 1)),
                  hintText: widget.description,
                  hintStyle: styling.subtitle.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: _showDescriptionError
                          ? Colors.red
                          : ColorsClass.sub_text)),
              controller: _descriptionController,
              minLines: 7,
              maxLines: 10,
            ),
          ),
          size.height(40),
          DeadLineWidget(
            controller: _deadlineController,
            onDateTap: () => _selectDate(context),
            title: "Deadline",
            labelText: widget.deadline.isEmpty
                ? "Choose your project deadline "
                : widget.deadline,
            selected: _showDeadlineError,
          ),
          if (_showDeadlineError)
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please choose a deadline',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ),
          size.height(40),
          Confirmbutton(text: widget.buttonText, onTap: _submitForm),
          size.height(30),
        ],
      ),
    );
  }
}
