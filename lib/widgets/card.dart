// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class reusableCard extends StatefulWidget {
  const reusableCard({Key? key}) : super(key: key);

  @override
  State<reusableCard> createState() => _reusableCardState();
}

class _reusableCardState extends State<reusableCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.purple, // Set card color to purple
        elevation: 5, // Add elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple.shade300,
                    ),
                    width: 100,
                    height: 40,
                    child: const Text(
                      'Full Time',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple.shade300,
                    ),
                    width: 100,
                    height: 40,
                    child: const Text(
                      'Remote',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Silentants Pvt Ltd',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white70),
                  SizedBox(width: 5),
                  Text(
                    'Chennai, India',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    '₹15k to ₹30k/month',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor:
                          Colors.white, // Set button color to white
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
