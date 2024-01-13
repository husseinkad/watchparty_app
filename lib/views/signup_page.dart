import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import '../utlies/custom_textstyles.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: CustomTextStyles.titleTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/signUpPageLogo.svg', width: 250,),
              ),
              const SizedBox(height: 40,),
              _buildTextField(
                controller: signUpController.displayNameController,
                labelText: 'Name',
                context: context,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: signUpController.emailController,
                labelText: 'Email', context: context,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: signUpController.passwordController,
                labelText: 'Password',
                obscureText: true,
                context: context,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: signUpController.confirmPasswordController,
                labelText: 'Confirm Password',
                obscureText: true,
                context: context,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: signUpController.signUp,
                  style: ElevatedButton.styleFrom(
                    textStyle: CustomTextStyles.defaultTextStyle,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('SignUp'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required BuildContext context,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: CustomTextStyles.defaultTextStyle,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
    );
  }
}
