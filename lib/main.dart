import 'package:alumini_job_refer_app/cubit/jobapp_cubit.dart';
import 'package:alumini_job_refer_app/presentation/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobappCubit>(
      create: (context) => JobappCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Alumini Job Refer App - AI Assisted',
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
