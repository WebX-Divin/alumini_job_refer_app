import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../MainScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            profileIems(
              title: 'Name',
              subtitle: 'Divin Dass',
              icon: CupertinoIcons.person,
            ),
            const SizedBox(
              height: 20,
            ),
            profileIems(
              title: 'Phone',
              subtitle: '1234567890',
              icon: CupertinoIcons.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            profileIems(
              title: 'year of Study',
              subtitle: 'II year',
              icon: CupertinoIcons.alt,
            ),
            const SizedBox(
              height: 20,
            ),
            profileIems(
              title: 'Email',
              subtitle: '123@gmail.com',
              icon: CupertinoIcons.mail,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
                child: const Text(
                  'Edit',
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
    );
  }
}

class profileIems extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const profileIems({
    super.key,
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
                offset: Offset(0, 5),
                color: Colors.purple.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.grey,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
