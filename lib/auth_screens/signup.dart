import 'package:alumini_job_refer_app/endpoints/backEndpoints.dart';
import 'package:alumini_job_refer_app/screens/homeScreen.dart';
import 'package:alumini_job_refer_app/widgets/textField.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Future<void> _signUp() async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;
      final mobile = mobileController.text;

      if (password != confirmPassword) {
        // Show an error message if passwords don't match
        return;
      }

      final response =
          await signUp(name, email, password, confirmPassword, mobile);

      if (response != null) {
        // Registration successful
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        print('User registered successfully');
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
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    textEditingController: nameController,
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
                  CustomTextField(
                    textEditingController: emailController,
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
                    textEditingController: mobileController,
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
                    textEditingController: passwordController,
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
                    textEditingController: confirmPasswordController,
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
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
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