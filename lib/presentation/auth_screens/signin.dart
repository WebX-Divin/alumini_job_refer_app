// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alumini_job_refer_app/MainScreen.dart';
import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/presentation/auth_screens/auth.dart';
import 'package:flutter/material.dart';

import 'package:alumini_job_refer_app/data/repository/job_repository.dart';
import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:alumini_job_refer_app/presentation/widgets/textField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/jobapp_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final jobRepository = JobRepository(JobDataProvider());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _homepage(String userType) async {
    await TokenHandler.saveData("userType", userType);

    if (mounted) {
      // Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
    }
  }

  Future<void> _register() async {
    const snackBar = SnackBar(
      content: Text('User Not Registered'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AuthScreen()));
  }

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      final password = passwordController.text;
      final mobile = mobileController.text;

      final response = await jobRepository.login(mobile, password);
      print('the response from login: ${response['token']}');
      if (response["token"] == null) {
        await _register();
      } else if (response != null) {
        await TokenHandler.saveData("name", response['name']);
        await TokenHandler.saveData("mobile", response['mobile']);
        await TokenHandler.saveData("email", response['email']);
        await TokenHandler.saveData("token", response['token']);
        await TokenHandler.saveData("userType", response['userType']);
        final userType = response["userType"];
        onLoginSuccess();
        await _homepage(userType);
      }
    }
  }

  void onLoginSuccess() {
    context.read<JobappCubit>().userDetails();
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
                  height: 170,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
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
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                    child: const Text(
                      'Login',
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
