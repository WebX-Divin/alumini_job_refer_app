import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:flutter/cupertino.dart';
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
  String? userType;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _userTypeData();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final isLoggedInString = await TokenHandler.getData("isLoggedIn");
    if (isLoggedInString != null && isLoggedInString == "true") {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  Future<void> _userTypeData() async {
    userType = await TokenHandler.getData("userType");
  }

  final List<Widget> _screensForAlumini = [
    const HomeScreen(),
    const PostScreen(),
    const ProfileScreen(),
  ];

  final List<Widget> _screensForStudent = [
    const HomeScreen(),
    const FindSkillScreen(),
    const ProfileScreen(),
  ];

  List<Widget> get _screens {
    if (userType == 'Alumni' || userType == 'Admin') {
      return _screensForAlumini;
    } else {
      return _screensForStudent;
    }
  }

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

class navigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const navigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  String? userType;

  @override
  void initState() {
    super.initState();
    _userTypeData();
  }

  Future<void> _userTypeData() async {
    userType = await TokenHandler.getData("userType");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      iconSize: 24.0,
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.purple,
      unselectedIconTheme: const IconThemeData(color: Colors.blueGrey),
      selectedIconTheme: const IconThemeData(color: Colors.purple),
      items: [
        _buildNavItem(CupertinoIcons.home, 'Home'),
        userType == 'Alumni'
            ? _buildNavItem(CupertinoIcons.add, 'Post')
            : _buildNavItem(CupertinoIcons.bolt_fill, 'Skill Finder'),
        _buildNavItem(CupertinoIcons.person, 'Profile'),
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
