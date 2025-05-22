import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Center(child: Text('Zilmor', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/onboarding1.jpg'),
            ),
            SizedBox(height: 30),
            Text(
              'Timeless Jewelry for Every Style',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Explore elegant, everyday and occasion-ready pieces that reflect your personality.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('Skip')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, _createRoute(Onboarding2()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3C1A10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 40),
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
