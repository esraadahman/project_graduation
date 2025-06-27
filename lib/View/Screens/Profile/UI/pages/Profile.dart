import 'package:gradution_project/Core/Imports/common_imports.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final name = UserPreferences.userName;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserInfoTop(
              userImage:
                  "https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
              userName: name.isNotEmpty ? name : "Esraa Dahman",
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
                context.navigateTo(ProfilePage());
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
