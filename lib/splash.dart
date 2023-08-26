import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signin_signup_project/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    // Wait for a few seconds, then navigate to the login page
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInForm()),
      );
    });
  }
  @override
  
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png'), // Your splash screen image
            SizedBox(height: 10),
            CircularProgressIndicator(), // Loading indicator
          ],
        ),
      );
  }
}