import 'package:alumini_job_refer_app/MainScreen.dart';
import 'package:flutter/material.dart';

class FindSkillSuccessScreen extends StatefulWidget {
  final dynamic skill;
  const FindSkillSuccessScreen({super.key, required this.skill});

  @override
  State<FindSkillSuccessScreen> createState() => _FindSkillSuccessScreenState();
}

class _FindSkillSuccessScreenState extends State<FindSkillSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/skill_success.png'),
              const SizedBox(height: 16.0),
              Text(
                'Based on your interest, ${widget.skill} is your skill. Look for jobs or internships similar to this field',
                textAlign: TextAlign.center, // Center the text
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width:
                    double.infinity, // Make the button width match the parent
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                  ),
                  child: const Text(
                    'Go to Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
