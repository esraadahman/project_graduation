import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class Emojiwidget extends StatefulWidget {
  const Emojiwidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<Emojiwidget> createState() => _EmojiwidgetState();
}

class _EmojiwidgetState extends State<Emojiwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) / 3,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 30),
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          // Add selected emoji to the text field
          widget.controller.text += emoji.emoji;
          widget.controller.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller.text.length));
        },
        onBackspacePressed: () {
          // Delete last character when backspace is pressed
          setState(() {
            if (widget.controller.text.isNotEmpty) {
              // Only remove the last character if the text is not empty
              String currentText = widget.controller.text;
              String updatedText =
                  currentText.substring(0, currentText.length - 1);
              widget.controller.text = updatedText;
              widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(
                      offset:
                          updatedText.length)); // Move the cursor to the end
            }
          });
        },
      ),
    );
  }
}
