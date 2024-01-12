import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:watchparty_app/controllers/login_controller.dart';

import '../utlies/custom_textstyles.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',  style: CustomTextStyles.titleTextStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/loginPageLogo.svg', width: 250,),
            ),
            const SizedBox(height: 40,),
            TextField(
              controller: loginController.usernameController,
              style: CustomTextStyles.defaultTextStyle,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: loginController.passwordController,
              obscureText: true,
              style: CustomTextStyles.defaultTextStyle,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loginController.login,
              child: const Text('Login',  style: CustomTextStyles.defaultTextStyle,),
            ),
          ],
        ),
      ),
    );
  }
}