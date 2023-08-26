import 'package:flutter/material.dart';
import 'package:signin_signup_project/home.dart';
import 'package:signin_signup_project/reset.dart';
import 'package:signin_signup_project/signin.dart';
import 'package:signin_signup_project/signup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:signin_signup_project/splash.dart';
import 'package:signin_signup_project/verification.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/splash',
      routes: {
        '/splash':(context) => SplashScreen(),
        '/signin':(context) => SignInForm(),
        '/signup':(context) => SignUpForm(),
        '/home':(context) => Home(),
        '/verify':(context) => EmailVerification(),
        '/reset_pass':(context) => PasswordResetPage()
      },
      
    );
  }
}

