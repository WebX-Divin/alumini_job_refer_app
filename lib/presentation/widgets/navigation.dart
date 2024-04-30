import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      selectedFontSize: 0,
      unselectedFontSize: 0,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      iconSize: 28.0,
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.purple,
      unselectedIconTheme: const IconThemeData(color: Colors.blueGrey),
      selectedIconTheme: const IconThemeData(color: Colors.purple),
      items: [
        _buildNavItem(CupertinoIcons.home, ''),
        userType == 'Alumni' || userType == 'Admin'
            ? _buildNavItem(CupertinoIcons.add, '')
            : _buildNavItem(CupertinoIcons.bolt_fill, ''),
        _buildNavItem(CupertinoIcons.person, ''),
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
