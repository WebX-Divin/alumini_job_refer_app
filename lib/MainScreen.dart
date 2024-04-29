import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:alumini_job_refer_app/presentation/widgets/navigation.dart';
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
      //body: _screens[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: userType != null
          ? navigationBar(
              userType: userType!,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : const SizedBox(),
    );
  }
}
