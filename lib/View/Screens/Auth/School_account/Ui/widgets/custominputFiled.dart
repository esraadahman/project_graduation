import 'package:project_graduation/Core/Imports/common_imports.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CustomInputField(
      {Key? key,
      required this.labelText,
      this.hintText = "",
      this.suffixIcon = false,
      this.isDense,
      this.onChanged,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.83,
      padding: EdgeInsets.symmetric(
        horizontal: width(context) / 1.2 / 20,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.labelText,
                style: styling.maintitle.copyWith(
                    fontSize: width(context) / 30,
                    fontWeight: FontWeight.bold,
                    color: ColorsClass.sub_text)),
          ),
          size.height(5),
          SizedBox(
            width: width(context) / 1.2,
            height: height(context) / 1.4 / 15,
            child: TextFormField(
              onChanged: widget.onChanged,
              obscureText: (widget.obscureText && _obscureText),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: ColorsClass.sub_text, width: 1)),
                isDense: (widget.isDense != null) ? widget.isDense : false,
                hintText: widget.hintText,
                hintStyle: styling.subtitle.copyWith(
                    color: ColorsClass.border_color,
                    fontSize: width(context) / 32,
                    fontWeight: FontWeight.normal),
                suffixIcon: widget.suffixIcon
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_outlined,
                          color: Colors.black54,
                          size: width(context) / 23,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                suffixIconConstraints: (widget.isDense != null)
                    ? const BoxConstraints(maxHeight: 33)
                    : null,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return LangClass.translate(context, 'required');
                }
                return null;
              },
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}
