import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

import '../../MainScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Profile> profiles = [
    Profile(
      imageUrl: "",
      name: "Dr.T.Akila",
      website: "",
      designation: "Project Guide | HoD - IT",
      email: "",
      phone_number: "",
    ),
    Profile(
      imageUrl: "",
      name: "Divin Dass",
      website: "",
      designation: "Project Lead",
      email: "",
      phone_number: "",
    ),
    Profile(
      imageUrl: "",
      name: "Sathiyan K",
      website: "github.com/",
      designation: "Team Mate",
      email: "",
      phone_number: "",
    ),
    Profile(
      imageUrl: "",
      name: "Meyyakumar I",
      website: "github.com/",
      designation: "Team Mate",
      email: "",
      phone_number: "",
    ),
    Profile(
      imageUrl: "",
      name: "Jayakumar E",
      website: "github.com/",
      designation: "Team Mate",
      email: "",
      phone_number: "",
    ),
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
          'Meet Our Creators',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: profiles[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
