import 'package:alumini_job_refer_app/presentation/widgets/profile_iems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../../MainScreen.dart';
import '../../cubit/jobapp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_screens/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late JobappCubit jobappCubit;

  @override
  void initState() {
    super.initState();
    jobappCubit = BlocProvider.of<JobappCubit>(context);
    jobappCubit.userDetails();
  }

  Future<void> _logout() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<JobappCubit, JobappState>(
        builder: (context, state) {
          if (state is JobappLoaded) {
            // Once user details are loaded, display them
            return buildProfileScreen(state);
          } else {
            // Display a loading indicator or handle other states
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildProfileScreen(JobappLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfilePicture(
              name: jobappCubit.userName!,
              radius: 51,
              fontsize: 51,
              random: true,
            ),
            const SizedBox(height: 20),
            ProfileItems(
              title: 'Name',
              subtitle: jobappCubit.userName!,
              icon: CupertinoIcons.person,
            ),
            const SizedBox(height: 20),
            ProfileItems(
              title: 'Phone',
              subtitle: jobappCubit.userMobile!,
              icon: CupertinoIcons.phone,
            ),
            const SizedBox(height: 20),
            ProfileItems(
              title: 'User Type',
              subtitle: jobappCubit.userUserType!,
              icon: CupertinoIcons.alt,
            ),
            const SizedBox(height: 20),
            ProfileItems(
              title: 'Email',
              subtitle: jobappCubit.userEmail!,
              icon: CupertinoIcons.mail,
            ),
            const SizedBox(height: 40),
            const Text(
              'NOTE: The data shown here are entered by you when you are sign up',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showDeleteConfirmationDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  child: const Text(
                    'Log out',
                    softWrap: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog() async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      // Navigate to the AuthScreen after deleting the account
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    }
  }
}
