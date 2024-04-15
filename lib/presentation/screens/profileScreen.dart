// profileScreen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../MainScreen.dart';
import '../../cubit/jobapp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobappCubit = BlocProvider.of<JobappCubit>(context);

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              profileItems(
                title: 'Name',
                subtitle: jobappCubit.userName ?? '',
                icon: CupertinoIcons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              profileItems(
                title: 'Phone',
                subtitle: jobappCubit.userMobile ?? '',
                icon: CupertinoIcons.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              profileItems(
                title: 'User Type',
                subtitle: jobappCubit.userUserType ?? '',
                icon: CupertinoIcons.alt,
              ),
              const SizedBox(
                height: 20,
              ),
              profileItems(
                title: 'Email',
                subtitle: jobappCubit.userEmail ?? '',
                icon: CupertinoIcons.mail,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'NOTE: The data shown here are entered by you when you are sign up',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
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
                    onPressed: () {},
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
      ),
    );
  }
}

class profileItems extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const profileItems({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

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
