import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchparty_app/views/landing_page.dart';
import 'package:watchparty_app/views/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Party',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Set primary color to light blue
        hintColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: LandingPage(),
    );
  }
}

