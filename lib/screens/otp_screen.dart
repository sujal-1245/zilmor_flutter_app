import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Dummy OTP for validation
const String correctOTP = "123456";

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> controllers =
  List.generate(6, (_) => TextEditingController());

  void _verifyOTP(BuildContext context) {
    String enteredOTP = controllers.map((c) => c.text).join();

    if (enteredOTP == correctOTP) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid OTP. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text('OTP Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              List.generate(6, (index) => _otpBox(context, index)),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _verifyOTP(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C1A10),
                minimumSize: Size.fromHeight(50),
              ),
              child: Text('Verify'),
            ),
            SizedBox(height: 20),
            Text('Resend in: 00:50',
                style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  Widget _otpBox(BuildContext context, int index) {
    return Container(
      width: 40,
      child: TextField(
        controller: controllers[index],
        autofocus: index == 0,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}

// ✅ Success screen
class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'OTP Verified Successfully!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You’re good to go.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
