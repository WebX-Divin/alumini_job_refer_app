import 'package:alumini_job_refer_app/MainScreen.dart';
import 'package:alumini_job_refer_app/cubit/jobapp_cubit.dart';
import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/data/repository/job_repository.dart';
import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/splashScreen.dart';

void main() async {
  bool isAuthenticated = await checkAuthentication();
  runApp(MyApp(isAuthenticated: isAuthenticated));
}

Future<bool> checkAuthentication() async {
  String? isAuthenticated = await TokenHandler.getData('token');
  if (isAuthenticated != null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;
  const MyApp({super.key, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobappCubit>(
      create: (context) => JobappCubit(
        JobRepository(
          JobDataProvider(),
        ),
      )..fetchJobs(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alumini Job Refer App with ML Skill Finder',
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        // home: const SplashScreen(),
        initialRoute: isAuthenticated ? 'home' : '/',
        routes: {
          '/': (context) => const SplashScreen(),
          'home': (context) => const MainScreen(),
        },
      ),
    );
  }
}
