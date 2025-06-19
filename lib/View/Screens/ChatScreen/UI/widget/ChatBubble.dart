import 'package:gradution_project/Core/Imports/common_imports.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String? message;
  final String? imageUrl;

  const ChatBubble({
    super.key,
    required this.isSender,
    this.message,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: isSender ? ColorsClass.appGradient : ColorsClass.softGreyGradient,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isSender ? 12 : 0),
            bottomRight: Radius.circular(isSender ? 0 : 12),
          ),
        ),
        child: imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              )
            : Text(
                message ?? '',
                style: styling.subtitle.copyWith(
                  fontSize: 14,
                  color: isSender ? ColorsClass.colorwhite : ColorsClass.text,
                  fontWeight: FontWeight.normal,
                ),
              ),
      ),
    );
  }
}
