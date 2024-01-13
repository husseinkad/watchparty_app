import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_models.dart';
import '../models/signup_models.dart';
import '../views/home_page.dart';



class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String apiUrl = 'http://192.168.200.19:3000/api/v1/user/login';
    final Map<String, dynamic> requestData = {
      'password': passwordController.text,
      'email': emailController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          // Use the LoginResponseModel
          final LoginResponseModel loginResponse = LoginResponseModel.fromJson(responseBody);

          // Save token to SharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', loginResponse.token);

          print('Login successful. Token: ${loginResponse.token}');
          // Add navigation or other logic here

          Get.snackbar('Login', 'Login successful');
          Get.to(HomePage());
        } else {
          print('Error: Response body is not a Map<String, dynamic>');
          // Handle errors accordingly
        }
      } else {
        // Handle errors
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle errors accordingly
      }
    } catch (error) {
      // Handle network errors or exceptions
      print('Error during login: $error');
      // Handle errors accordingly
    }
  }
}