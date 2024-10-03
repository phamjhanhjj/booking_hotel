import 'package:booking_hotel/screens/forgot_password/forget_password_mail/Utils.dart';
import 'package:booking_hotel/screens/forgot_password/forget_password_phone/new_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyOtp extends StatefulWidget {
  final String verificationId;

  const MyOtp({Key? key, required this.verificationId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyOtpState createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final otpController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void verifyOtp() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otpController.text,
    );

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const NewPassword(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        Utils.showSnackBar('Failed to verify OTP', context);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utils.showSnackBar('Failed to verify OTP', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                labelText: 'Enter your OTP',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: verifyOtp,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}
