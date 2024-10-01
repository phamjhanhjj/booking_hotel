import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_screens/home_screen.dart';

class LoginFacebook extends StatefulWidget {
  const LoginFacebook({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFacebookState createState() => _LoginFacebookState();
}

class _LoginFacebookState extends State<LoginFacebook> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    final AccessToken result =
        (await FacebookAuth.instance.login()) as AccessToken;
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);
    return await _auth.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in with Facebook'),
          onPressed: () async {
            final UserCredential? userCredential = await signInWithFacebook();
            if (userCredential != null) {
              Navigator.pushReplacement(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else {
              print('Sign in failed');
            }
          },
        ),
      ),
    );
  }
}
