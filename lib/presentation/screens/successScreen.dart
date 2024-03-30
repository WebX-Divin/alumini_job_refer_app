import 'package:flutter/material.dart';
import 'package:alumini_job_refer_app/presentation/screens/homeScreen.dart';

class successScreen extends StatelessWidget {
  const successScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => const HomeScreen(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Text('Job Posted Successfully'),
                ))
          ],
        ),
      ),
    );
  }
}
