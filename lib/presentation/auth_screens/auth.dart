import 'package:alumini_job_refer_app/presentation/auth_screens/signin.dart';
import 'package:alumini_job_refer_app/presentation/auth_screens/signup.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: const TabBarView(
          children: [
            SignIn(),
            SignUp(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              /*icon: Icon(Icons.lock, color: Colors.black45),*/
              text: 'Login',
            ),
            Tab(
              /*icon: Icon(Icons.person, color: Colors.black45),*/
              text: 'Register',
            ),
          ],
          indicatorColor: Colors.purple,
          indicatorWeight: 5,
          dividerColor: Colors.white,
        ),
      ),
    );
  }
}
