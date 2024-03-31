import 'package:flutter/material.dart';
import '../../models/job_models.dart';

class reusableCard extends StatelessWidget {
  final JobModel jobModel;

  const reusableCard({Key? key, required this.jobModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.purple,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple.shade300,
                    ),
                    width: 100,
                    height: 40,
                    child: Text(
                      jobModel.fullTime ? 'Full Time' : 'Intern',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple.shade300,
                    ),
                    width: 100,
                    height: 40,
                    child: Text(
                      jobModel.remote ? 'Remote' : 'On-site',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                jobModel.role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                jobModel.companyName,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white70),
                  const SizedBox(width: 5),
                  Text(
                    jobModel.location,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '₹${jobModel.salary.toString()}/month',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
