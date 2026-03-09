import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';
import 'package:tthakkr_app/core/icons/custom_icons_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: .shifting,
        elevation: 0,
        currentIndex: navigationShell.currentIndex,
        fixedColor: Colors.white,
        selectedIconTheme: IconThemeData(color: AppColors.gold),
        //selectedFontSize: 11,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          navigationShell.goBranch(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Prayers',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.praying_hands, size: 20),
            label: 'Athkar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.compass, size: 25),
            label: 'Qiblah',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.sort_name_up, size: 20),
            label: 'Subhah',
          ),
        ],
      ),
      body: navigationShell,
    );
  }
}
