import 'package:alumini_job_refer_app/presentation/screens/findSkillSuccessScreen.dart';
import 'package:flutter/material.dart';

import '../../MainScreen.dart';
import '../../data/data_provider/job_data_provider.dart';
import '../../data/repository/job_repository.dart';

class FindSkillScreen extends StatefulWidget {
  const FindSkillScreen({super.key});

  @override
  State<FindSkillScreen> createState() => _FindSkillScreenState();
}

class _FindSkillScreenState extends State<FindSkillScreen> {
  final Map<String, int?> _ratings = {};
  final Map<String, TextEditingController> _skillControllers = {};

  @override
  void initState() {
    super.initState();
    // Initialize _ratings with default values for all skills
    _skills.forEach((skill) {
      _ratings[skill] = null; // Set default value to null
      _skillControllers[skill] = TextEditingController();
    });
  }

  @override
  void dispose() {
    _skillControllers.forEach((key, value) => value.dispose());
    super.dispose();
  }

  Future<void> _handleUserRatings() async {
    try {
      final ratings = {
        "Database_Fundamentals": 0,
        "Computer_Architecture": 0,
        "Distributed_Computing_Systems": 0,
        "Cyber_Security": 0,
        "Networking": 0,
        "Development": 0,
        "Programming_Skills": 0,
        "Project_Management": 0,
        "Computer_Forensics_Fundamentals": 0,
        "Technical_Communication": 0,
        "AI_ML": 0,
        "Software_Engineering": 0,
        "Business_Analysis": 0,
        "Communication_skills": 0,
        "Data_Science": 0,
        "Troubleshooting_skills": 0,
        "Graphics_Designing": 0,
      };

      _skillControllers.forEach((key, value) {
        final skillRating = int.tryParse(value.text);
        if (skillRating != null) {
          ratings[key.replaceAll(' ', '_')] = skillRating;
        }
      });

      final result =
          await JobRepository(JobDataProvider()).sendSkillRatings(ratings);
      final prediction = result['prediction'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FindSkillSuccessScreen(skill: prediction),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  final List<String> _skills = [
    'Database Fundamentals',
    'Computer Architecture',
    'Distributed Computing Systems',
    'Cyber Security',
    'Networking',
    'Software Development',
    'Programming Skills',
    'Project Management',
    'Computer Forensics Fundamentals',
    'Technical Communication',
    'AI ML',
    'Software Engineering',
    'Business Analysis',
    'Communication skills',
    'Data Science',
    'Troubleshooting skills',
    'Graphics Designing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'Find My Skill',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _skills.length + 1, // Add 1 for the button item
        itemBuilder: (context, index) {
          if (index == _skills.length) {
            // Display the button as the last item
            return Column(
              children: [
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleUserRatings,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                    ),
                    child: const Text(
                      'Find',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          } else {
            // Display the skill items
            final skill = _skills[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    skill,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButton<int>(
                      isExpanded: true,
                      value: _ratings[skill],
                      onChanged: (value) {
                        setState(() {
                          _ratings[skill] = value!;
                          _skillControllers[skill]?.text = value.toString();
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Not Interested'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Poor'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('Beginner'),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('Average'),
                        ),
                        DropdownMenuItem(
                          value: 6,
                          child: Text('Intermediate'),
                        ),
                        DropdownMenuItem(
                          value: 7,
                          child: Text('Excellent'),
                        ),
                        DropdownMenuItem(
                          value: 9,
                          child: Text('Professional'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
