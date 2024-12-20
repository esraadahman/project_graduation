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
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.sub_text),
            ),
          ),
          //   size.height(10),
          SizedBox(
            width: 400,
            height: 50,
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
                hintStyle: const TextStyle(color: ColorsClass.sub_text),
                suffixIcon: widget.suffixIcon
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_outlined,
                          color: Colors.black54,
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
