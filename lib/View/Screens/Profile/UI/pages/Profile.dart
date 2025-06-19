import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/ChatScreen/UI/page/ChatScreen.dart';
import 'package:gradution_project/View/Screens/Logout/Ui/page/logout.dart';
import 'package:gradution_project/View/Screens/MessagesScreen/UI/page/MessagesScreen.dart';
import 'package:gradution_project/View/Screens/Profile/UI/widgets/IconsWidgets.dart';
import 'package:gradution_project/View/Screens/Profile/UI/widgets/userInfoTop.dart';
import 'package:gradution_project/View/Screens/Settings/UI/page/settings.dart';
import 'package:gradution_project/View/Screens/Templates/UI/page/TemplatesPage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserInfoTop(
              userImage:
                  "https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
              userName: "Esraa Dahman",
              items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/templates.svg',
              namePage: "Templates",
              onclick: () {
                context.navigateTo(const TemplatesPage());
              },
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/calendar.svg',
              namePage: "Calendar",
              onclick: () {},
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/workspace.svg',
              namePage: "Work Spaces",
              onclick: () {
                context.navigateTo(Workspaces());
              },
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/chat.svg',
              namePage: "Chat",
              onclick: () {
                // context.navigateTo(ChatScreen(
                //     userName: "Esraa Dahman",
                //     userImage: "assets/images/profile1.png",
                //     userLastSeen: "1 hour ago"));
                context.navigateTo(MessagesScreen());
              },
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/community.svg',
              namePage: "Community",
              onclick: () {},
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/analytics.svg',
              namePage: "Analytics",
              onclick: () {},
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/settings.svg',
              namePage: "Settings",
              onclick: () {
                context.navigateTo(
                  ProfilePage(
        //               themeMode: _themeMode,
        // onThemeChanged: toggleTheme,
                ));
              },
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/support.svg',
              namePage: "Support",
              onclick: () {},
            ),
            size.height(32),
            IconsWidgets(
              iconName: 'assets/images/logout.svg',
              namePage: "Logout",
              onclick: () {
                context.navigateTo(const LogoutScreen());
              },
            ),
            size.height(32),
          ],
        ),
      ),
    );
  }
}
