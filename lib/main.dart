import 'package:alumini_job_refer_app/cubit/jobapp_cubit.dart';
import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/data/repository/job_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/findSkillScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        title: 'Alumini Job Refer App - AI Assisted',
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        home: const FindSkillScreen(),
      ),
    );
  }
}
