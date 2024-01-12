import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../views/home_page.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() {
    // Add your signup logic here
    String email = emailController.text;
    String password = passwordController.text;

    // Perform signup logic, e.g., API call or authentication
    // For simplicity, let's print the data for now
    print('Email: $email, Password: $password');

    // Navigate to the next screen or perform any other action
    Get.snackbar('SignUp', 'Signup successful');
    Get.to(const HomePage());
  }
}