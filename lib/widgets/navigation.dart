// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({Key? key}) : super(key: key);

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex == index
            ? _animationController.reverse()
            : _animationController.forward(from: 0.0);
        setState(() {
          _currentIndex = index;
        });

        // Handle navigation based on index
        // switch (index) {
        //   case 0:
        //     Navigator.pushReplacementNamed(context, '/home');
        //     break;
        //   case 1:
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => ()));
        //     break;
        //   case 2:
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => ()));
        //     break;
        // }
      },
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2),
          label: 'Profile',
        ),
      ],
    );
  }
}
