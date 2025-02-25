import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';


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
    Center(
      child: Text("hhh"),
    ),
    const ProfilePage(),
  ];

  final svgIconList = <String>[
    'assets/images/home-2.svg',
    'assets/images/stash_user-group (2).svg',
    'assets/images/ph_files-duotone.svg',
    'assets/images/user.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.colorwhite,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          context.navigateTo(Workspaces());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: svgIconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? ColorsClass.light_gradient : Colors.grey;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              svgIconList[index],
              color: color,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
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
