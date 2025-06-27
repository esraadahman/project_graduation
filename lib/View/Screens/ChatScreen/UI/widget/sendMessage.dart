import 'package:gradution_project/Core/Imports/common_imports.dart';

class SendMessage extends StatefulWidget {
  final String chatid;
  const SendMessage({super.key, required this.chatid});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  bool showEmoji = false;
  final TextEditingController _controller = TextEditingController();
  bool showAttachmentMenu = false;

  void toggleEmojiPicker() {
    setState(() {
      showEmoji = !showEmoji;
    });
  }

  void toggleAttachmentMenu() {
    setState(() {
      showAttachmentMenu = !showAttachmentMenu;
      if (showAttachmentMenu) {
        showEmoji = false;
        FocusScope.of(context).unfocus();
      }
    });
  }

  final record = AudioRecorder();
  bool isRecording = false;
  String path = "";

  Future<void> start_record() async {
    final location = await getApplicationDocumentsDirectory();
    final filename = '${location.path}/${const Uuid().v4()}.m4a';

    if (await record.hasPermission()) {
      await record.start(
        const RecordConfig(),
        path: filename,
      );
      setState(() {
        isRecording = true;
      });
    }
  }

  Future<void> stop_record() async {
    final recordedPath = await record.stop();
    setState(() {
      path = recordedPath ?? '';
      isRecording = false;
    });

    // Upload logic
    // firebase_chats.uploadAudio(widget.chatid!, path!, "voice record");
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showAttachmentMenu)
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: ImagesVideo(chatid: widget.chatid),
            ),
          size.height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              size.width(width(context) / 20),
              // Input Container
              Expanded(
                child: Container(
                  height: 45.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: ColorsClass.lightBlue2,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorsClass.border_color,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: isRecording
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(10, (index) {
                            return AnimatedContainer(
                              duration:
                                  Duration(milliseconds: 300 + index * 100),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              width: 4,
                              height: (10 + index * 2).toDouble(),
                              decoration: BoxDecoration(
                                color: ColorsClass.text,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        )
                      : Row(
                          children: [
                            //     size.width(10),
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  fillColor: ColorsClass.lightBlue2,
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(fontSize: 14.sp),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  prefixIcon: GestureDetector(
                                      onTap: () {
                                        // hide keyboard
                                        FocusScope.of(context).unfocus();
                                        toggleEmojiPicker();
                                      },
                                      child: const Icon(
                                          Icons.emoji_emotions_outlined,
                                          color: Colors.grey)),
                                ),
                              ),
                            ),

                            const Icon(Icons.link, color: Colors.grey),
                            size.width(10.w),
                            GestureDetector(
                              onTap: () {
                                toggleAttachmentMenu();
                              },
                              child: const Icon(Icons.camera_alt_outlined,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                ),
              ),
              size.width(10.w),
              // Mic button outside
              Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: ColorsClass.appGradient,
                ),
                child: IconButton(
                  icon: Icon(Icons.mic, color: Colors.white, size: 20.sp),
                  onPressed: () {
                    if (isRecording == false) {
                      start_record();
                    } else {
                      stop_record();
                    }
                  },
                ),
              ),
            ],
          ),
          size.height(10),
          // Show Emoji Picker only when showEmoji is true

          if (showEmoji)
            Center(
              child: Emojiwidget(controller: _controller),
            ),
        ],
      ),
    );
  }
}
