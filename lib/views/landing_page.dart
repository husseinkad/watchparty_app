import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:watchparty_app/utlies/custom_textstyles.dart';
import 'package:watchparty_app/views/login_page.dart';
import 'package:watchparty_app/views/signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Watch Party App', style: CustomTextStyles.titleTextStyle,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo.svg', width: 300,),
            const SizedBox(height: 20),
            const Text(
              'Watch Together, Anytime, Anywhere',
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleTextStyleBold
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: const Text('Log In', style: CustomTextStyles.defaultTextStyle,),
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                Get.to(SignUpPage());
              },
              child: const Text('Sign Up', style: CustomTextStyles.defaultTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}