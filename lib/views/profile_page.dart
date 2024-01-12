import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                'https://i.guim.co.uk/img/media/66767bbb27ae0e99d0dfb2975ff2a2b3db9e1c93/37_6_1612_967/master/1612.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=2a212447d637483b953a4e91b042f0ce',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement logic for editing information
                  print('Edit Information button pressed');
                },
                child: const Text('Edit Information'),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement logic for viewing uploaded videos
                  print('View Uploaded Videos button pressed');
                },
                child: const Text('View Uploaded Videos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}