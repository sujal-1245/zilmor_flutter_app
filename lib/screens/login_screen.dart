import 'package:flutter/material.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text('Welcome login to\nyour account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {}, child: Text('Forgot Password?')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, _createRoute(OTPScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C1A10),
                minimumSize: Size.fromHeight(50),
              ),
              child: Text('Sign in', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 24),
            Center(child: Text('Or sign in with')),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook),
                SizedBox(width: 20),
                Icon(Icons.apple),
                SizedBox(width: 20),
                Icon(Icons.g_mobiledata),
              ],
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text("Don't have an account? Sign up"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Route _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offset = Tween(begin: Offset(1.0, 0.0), end: Offset.zero).animate(animation);
        return SlideTransition(position: offset, child: child);
      },
    );
  }
}
