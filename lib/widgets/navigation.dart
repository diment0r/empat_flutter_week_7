import 'package:empat_flutter_week_7/pages/settings_page.dart';
import 'package:empat_flutter_week_7/pages/users_page.dart';
import 'package:flutter/material.dart';

class AppNavigationWidget extends StatefulWidget {
  const AppNavigationWidget({super.key});

  @override
  State<AppNavigationWidget> createState() => _AppNavigationWidgetState();
}

class _AppNavigationWidgetState extends State<AppNavigationWidget> {
  int currentIndex = 0;
  late PageController pageController;

  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle_outlined),
      label: 'Users',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onNavBarItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onPageChanged(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 40),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DIMENTOR',
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onNavBarItemTap,
        children: [
          UsersPageWidget(),
          SettingsPageWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        items: navBarItems,
        onTap: onPageChanged,
      ),
    );
  }
}
