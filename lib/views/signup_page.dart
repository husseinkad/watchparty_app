import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import '../utlies/custom_textstyles.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final SignUpController signUpController = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: CustomTextStyles.titleTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/signUpPageLogo.svg', width: 250,),
            ),
            const SizedBox(height: 40,),
            TextField(
              controller: signUpController.emailController,
              style: CustomTextStyles.defaultTextStyle,
              decoration: const InputDecoration(labelText: 'Email',),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: signUpController.passwordController,
              obscureText: true,
              style: CustomTextStyles.defaultTextStyle,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: signUpController.signUp,
              child: const Text('Sign Up', style: CustomTextStyles.defaultTextStyle,),
            ),
          ],
        ),
      ),
    );
  }
}