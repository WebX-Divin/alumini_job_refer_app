// ignore_for_file: file_names
import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/data/repository/job_repository.dart';
import 'package:alumini_job_refer_app/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/jobapp_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobappCubit(
        JobRepository(
          JobDataProvider(),
        ),
      )..fetchJobs(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle settings icon tap
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.purple,
                      ),
                      child: const Icon(Icons.settings, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<JobappCubit, JobappState>(
                  builder: (context, state) {
                    if (state is JobappLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is JobappLoaded) {
                      return ListView.builder(
                        itemCount: state.jobs.length,
                        itemBuilder: (context, index) {
                          return reusableCard(jobModel: state.jobs[index]);
                        },
                      );
                    } else if (state is JobappError) {
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    } else {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
