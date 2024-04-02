import 'package:flutter/material.dart';
import 'presentation/screens/findSkillScreen.dart';
import 'presentation/screens/homeScreen.dart';
import 'presentation/screens/postScreen.dart';
import 'presentation/screens/profileScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const PostScreen(),
    const FindSkillScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: navigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class navigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const navigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      iconSize: 24.0,
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.purple,
      unselectedIconTheme: const IconThemeData(color: Colors.blueGrey),
      selectedIconTheme: const IconThemeData(color: Colors.purple),
      items: [
        _buildNavItem(Icons.home, 'Home'),
        _buildNavItem(Icons.add, 'Post'),
        _buildNavItem(Icons.fitbit_outlined, 'Finder'),
        _buildNavItem(Icons.person, 'Profile'),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
