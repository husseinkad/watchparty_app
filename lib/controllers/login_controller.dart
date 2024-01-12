import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../views/home_page.dart';


class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    // Add your login logic here
    String username = usernameController.text;
    String password = passwordController.text;

    // Perform login logic, e.g., API call or authentication
    // For simplicity, let's print the data for now
    print('Username: $username, Password: $password');

    // Navigate to the next screen or perform any other action
    Get.snackbar('Login', 'Login successful');
    Get.to(HomePage());
  }
}