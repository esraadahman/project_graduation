import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:flutter/cupertino.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int _bottomNavIndex = 0;

  final List<Widget> _pages = [
    const NavigateHomePage(),
    const ChatPage(),
    //  const FilesPage(),
    Workspaces(),
    const ProfilePage(),
  ];
  final iconList = <IconData>[
    Icons.home,
    CupertinoIcons.chat_bubble_text,
    CupertinoIcons.doc_on_clipboard_fill,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(184, 255, 255, 255),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          print("Floating Action Button Pressed");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        activeColor: ColorsClass.light_gradient,
        inactiveColor: Colors.grey,
        iconSize: 33,
        backgroundColor: Colors.white,
        shadow: const BoxShadow(color: ColorsClass.lightGrey, blurRadius: 2),
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _pages,
      ),
    );
  }
}
