// ignore_for_file: file_names

import 'dart:async';
import 'package:alumini_job_refer_app/MainScreen.dart';
import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:alumini_job_refer_app/presentation/auth_screens/auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Future<bool> checkAuthentication() async {
  String? isAuthenticated = await TokenHandler.getData('token');
  if (isAuthenticated != null) {
    return true;
  }
  return false;
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    bool isAuthenticated = await checkAuthentication();
    Timer(const Duration(seconds: 2), () {
      isAuthenticated
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()))
          : Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('images/logo.png'),
            ),
            const Text(
              'Alumini Job Refer App with ML Skill Finder',
              style: TextStyle(fontSize: 10, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
