import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchparty_app/views/uploads_page.dart';

import 'edit_user_info_page.dart';

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
                'https://cdn.vox-cdn.com/thumbor/S7APkbn99b1oVsds_1JBhvdzsWU=/0x0:2000x1000/1400x1400/filters:focal(814x298:815x299)/cdn.vox-cdn.com/uploads/chorus_asset/file/10440907/Thanos_MCU.jpg',
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
                  Get.to(EditUserInfoPage());
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
                  Get.to(UploadsPage());
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