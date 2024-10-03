import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../forget_password_mail/Utils.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void updatePassword() async {
    if (_auth.currentUser != null) {
      _auth.currentUser!.updatePassword(passwordController.text).then((_) {
        // ignore: use_build_context_synchronously
        Utils.showSnackBar('Password updated successfully', context);
      }).catchError((error) {
        // ignore: use_build_context_synchronously
        Utils.showSnackBar('Password could not be updated', context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your new password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: updatePassword,
              child: const Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}