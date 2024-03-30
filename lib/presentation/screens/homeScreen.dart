// ignore_for_file: file_names

import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/data/repository/job_repository.dart';
import 'package:alumini_job_refer_app/presentation/widgets/card.dart';
import 'package:alumini_job_refer_app/presentation/widgets/navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final jobRepository = JobRepository(JobDataProvider());

  @override
  void initState() {
    super.initState();
    jobRepository.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Padding of 10 in all directions
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust border radius as needed
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
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple, // Set container background color
                    ),
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                ),
              ],
            ),
            const reusableCard(),
          ],
        ),
      ),
      bottomNavigationBar: const navigationBar(),
    );
  }
}
