import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/signup_models.dart';
import '../views/home_page.dart';

class SignUpController extends GetxController {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> signUp() async {
    const String apiUrl = 'http://192.168.200.19:3000/api/v1/user/signup';
    final Map<String, dynamic> requestData = {
      'displayName': displayNameController.text,
      'password': passwordController.text,
      'passwordConform': confirmPasswordController.text,
      'email': emailController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        final dynamic responseBody = json.decode(response.body);
        Get.snackbar('SignUp', 'Signup successful');
        Get.to(HomePage());
        if (responseBody is Map<String, dynamic>) {
          // Save token to SharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', responseBody['token']);

          // Parse user data
          if (responseBody.containsKey('user')) {
            final UserModel user = UserModel.fromJson(responseBody['user']);
            print('Sign-up successful for user: ${user.displayName}, ${user
                .email}');
            // Add navigation or other logic here
          } else {
            print('Error: User data not found in the response');
            // Handle errors accordingly
          }
        } else {
          print('Error: Response body is not a Map<String, dynamic>');
          // Handle errors accordingly
        }
      } else {
        // Handle errors
        print('Sign-up failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle errors accordingly
      }
    } catch (error) {
      // Handle network errors or exceptions
      print('Error during sign-up: $error');
      // Handle errors accordingly
    }
  }
}



