import 'package:flutter/material.dart';

import '../controllers/edit_user_info_controller.dart';
import '../utlies/custom_textstyles.dart';

class EditUserInfoPage extends StatelessWidget {
  final UserInfoController controller = UserInfoController();

  EditUserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Info Page',
          style: CustomTextStyles.defaultTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(controller.profilePicture),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Name:',
                  style: CustomTextStyles.defaultTextStyle,
                ),
              ),
              TextField(
                onChanged: (value) => controller.name.value = value,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.grey[700],
                  ),

                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0), // Adjust the border radius as needed
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Add padding
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Email:',
                style: CustomTextStyles.defaultTextStyle,
              ),
              Text(
                controller.email,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement save functionality here
                  // You can update user information on the server or local storage
                  // For now, let's print the updated information
                  print('Name: ${controller.name}');
                  print('Email: ${controller.email}');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                  ),
                ),
                child: const Text('Save', style: CustomTextStyles.defaultTextStyle,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
