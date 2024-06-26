// ignore_for_file: file_names

import 'package:alumini_job_refer_app/MainScreen.dart';
import 'package:alumini_job_refer_app/presentation/screens/postSuccessScreen.dart';
import 'package:flutter/material.dart';

import '../../data/data_provider/job_data_provider.dart';
import '../../data/repository/job_repository.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final jobRepository = JobRepository(JobDataProvider());

  final _formKey = GlobalKey<FormState>();

  final _jobRoleController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _jobDescriptionController = TextEditingController();
  final _locationController = TextEditingController();
  bool _isPartTime = false;
  bool _isOffice = false;
  final _salaryController = TextEditingController();
  final _referralCodeController = TextEditingController();
  final _applyLinkController = TextEditingController();

  void _saveChanges() async {
    //final job = _jobRoleController.text;
    if (_formKey.currentState!.validate()) {
      String role = _jobRoleController.text;
      String companyName = _companyNameController.text;
      String description = _jobDescriptionController.text;
      String location = _locationController.text;
      bool remote = _isPartTime;
      bool fullTime = _isOffice;
      String salary = _salaryController.text;
      String referal = _referralCodeController.text;
      String link = _applyLinkController.text;

      final result = await jobRepository.createPost(role, companyName,
          description, location, remote, fullTime, salary, referal, link);

      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PostSuccessScreen(),
          ),
        );
      }
    }
    setState(() {});
  }

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
          'Post a Job',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Job Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _jobRoleController,
                      decoration: const InputDecoration(
                        labelText: 'Job Role',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a job role';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _companyNameController,
                      decoration: const InputDecoration(
                        labelText: 'Company Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a company name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _jobDescriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Job Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a job description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.location_on),
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Job Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      title: const Text('Remote'),
                      value: _isPartTime,
                      onChanged: (value) {
                        setState(() {
                          _isPartTime = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Office'),
                      value: _isOffice,
                      onChanged: (value) {
                        setState(() {
                          _isOffice = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Additional Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _salaryController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.currency_rupee_sharp),
                        labelText: 'Salary',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a salary';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _referralCodeController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.code),
                        labelText: 'Referral Code',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _applyLinkController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.link),
                        labelText: 'Apply Link (without http)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an apply link';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _saveChanges();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text(
                  'Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
