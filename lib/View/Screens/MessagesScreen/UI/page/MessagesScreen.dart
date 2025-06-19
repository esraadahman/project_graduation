import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/ChatScreen/UI/page/ChatScreen.dart';
import 'package:gradution_project/View/Screens/MessagesScreen/UI/widget/MessageWidget.dart';
import 'package:gradution_project/View/Screens/MessagesScreen/UI/widget/SpacerContainer.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.background,
      appBar: HeaderTitle(
        title: "Messages",
        onMorePressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(20),
            // Group chat
            const MessageWidget(
                HeaderTitle: "Group Chat",
                HeaderSubTitle: "Last message",
                HeaderDate: "12-12-2023",
                UserImage: 'assets/images/profile2.png'),
            size.height(30),
            Padding(
              padding: const EdgeInsets.only(
                left: 28,
              ),
              child: Container(
                height: 2,
                width: width(context) / 1.25,
                decoration:
                    const BoxDecoration(gradient: ColorsClass.ContainerSpacer),
              ),
            ),
            size.height(50),
            // Users Chat
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SpacerContainer();
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.navigateTo(ChatScreen(
                        userName: "User Name ${index + 1}",
                        userImage: "assets/images/profile1.png",
                        userLastSeen: "1 hour ago"));
                  },
                  child: MessageWidget(
                    HeaderTitle: "User Chat ${index + 1}",
                    HeaderSubTitle: "Last message",
                    HeaderDate: "12-12-2023",
                    UserImage: "assets/images/profile1.png",
                  ),
                );
              },
            ),
            size.height(50),
          ],
        ),
      ),
    );
  }
}
