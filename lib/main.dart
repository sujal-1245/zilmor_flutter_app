import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding1.dart';
import 'screens/onboarding2.dart';
import 'screens/onboarding3.dart';
import 'screens/login_screen.dart';
import 'screens/otp_screen.dart';

void main() {
  runApp(const ZilmorApp());
}

class ZilmorApp extends StatelessWidget {
  const ZilmorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zilmor',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFDF6F0), // Beige
        fontFamily: 'ZilmorFont', // replace with actual font family
        primaryColor: Color(0xFF3C1A10), // Dark brown
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding1': (context) => Onboarding1(),
        '/onboarding2': (context) => Onboarding2(),
        '/onboarding3': (context) => Onboarding3(),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OTPScreen(),
      },
    );
  }
}
