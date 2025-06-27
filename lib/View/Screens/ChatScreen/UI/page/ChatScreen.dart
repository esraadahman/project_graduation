import 'package:gradution_project/Core/Imports/common_imports.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.userName,
    required this.userImage,
    required this.userLastSeen,
  });

  final String userName;
  final String userImage;
  final String userLastSeen;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            ChatTopBar(
              userName: widget.userName,
              userImagePath: widget.userImage,
              lastSeen: widget.userLastSeen,
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return ChatBubble(
                    isSender: msg.isSender,
                    message: msg.text,
                    imageUrl: msg.image,
                  );
                },
              ),
            ),
            size.height(height(context) / 9)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: SendMessage(chatid: "2"),
    );
  }
}
