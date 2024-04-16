import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import '../../MainScreen.dart';
import '../../cubit/jobapp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_screens/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
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
    await TokenHandler.getData("isLoggedIn");
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
                  onPressed: () {},
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
}

class ProfileItems extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const ProfileItems({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.purple.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
        tileColor: Colors.white,
      ),
    );
  }
}
