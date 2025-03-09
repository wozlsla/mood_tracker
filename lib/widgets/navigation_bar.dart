import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/utils.dart';
import 'package:mood_tracker/views/post_screen.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(BuildContext context, int index) {
    if (index == 1) {
      _onWriteTap(context);
      return;
    }

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void _onWriteTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.92,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) => PostScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, FontAwesomeIcons.house, 0),
              _buildNavItem(context, FontAwesomeIcons.penToSquare, 1),
              _buildNavItem(context, FontAwesomeIcons.user, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, int index) {
    final isSelected = index == navigationShell.currentIndex;
    final isDark = isDarkMode(context);

    return IconButton(
      icon: FaIcon(
        icon,
        color:
            isSelected
                ? (isDark ? Colors.white : Colors.black)
                : (isDark ? Colors.grey : Colors.black54),
      ),
      onPressed: () => _onTap(context, index),
    );
  }
}



/*

BottomNavigationBar(
        onTap: (index) => _onTap(context, index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: isDark ? Colors.grey : Colors.black54,
        unselectedItemColor: isDark ? Colors.grey : Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.penToSquare),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "",
          ),
        ],
        backgroundColor: isDark ? Colors.grey.shade900 : null,
      ), */