import 'package:alumini_job_refer_app/MainScreen.dart';
import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/data/repository/job_repository.dart';
import 'package:alumini_job_refer_app/presentation/auth_screens/auth.dart';
import 'package:flutter/material.dart';
import '../../data/token/tokenhandler.dart';
import '../widgets/textField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _jobRepository = JobRepository(JobDataProvider());
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();

  String? _selectedRadioValue = 'Student';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _navigateToHomepage() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  Future<void> _navigateToLogin() async {
    const snackBar = SnackBar(
      content: Text('User already registered'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final mobile = _mobileController.text;
      final userType = _selectedRadioValue!;

      final result =
          await _jobRepository.signUp(name, email, password, mobile, userType);

      if (result['error'] == 'Email already registered') {
        await _navigateToLogin();
      } else {
        final token = result["token"];
        final user = result["userType"];
        await TokenHandler.saveData('token', token);
        await TokenHandler.saveData("userType", user);
        await _navigateToHomepage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'images/logo.png',
                  height: 100,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    textEditingController: _nameController,
                    iconData: Icons.person,
                    hintText: 'Name',
                    isVisible: false,
                    isEnabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'Student',
                        groupValue: _selectedRadioValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedRadioValue = value!;
                          });
                        },
                      ),
                      const Text('Student'),
                      const SizedBox(width: 16),
                      Radio<String>(
                        value: 'Alumni',
                        groupValue: _selectedRadioValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedRadioValue = value!;
                          });
                        },
                      ),
                      const Text('Alumni'),
                    ],
                  ),
                  CustomTextField(
                    textEditingController: _emailController,
                    iconData: Icons.email,
                    hintText: 'Email',
                    isVisible: false,
                    isEnabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    textEditingController: _mobileController,
                    iconData: Icons.phone,
                    hintText: 'Mobile',
                    isVisible: false,
                    isEnabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    textEditingController: _passwordController,
                    iconData: Icons.lock,
                    hintText: 'Password',
                    isVisible: true,
                    isEnabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    textEditingController: _confirmPasswordController,
                    iconData: Icons.lock,
                    hintText: 'Confirm Password',
                    isVisible: true,
                    isEnabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
