import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../home_screens/home_screen.dart';

class LoginFacebook extends StatefulWidget {
  const LoginFacebook({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFacebookState createState() => _LoginFacebookState();
}

class _LoginFacebookState extends State<LoginFacebook> {

Future<UserCredential> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/facebook.jpg',
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Our App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/logos/facebook.jpg',
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text('Sign in with Facebook'),
                ],
              ),
              onPressed: () async {
                try {
                  final UserCredential? userCredential =
                      await signInWithFacebook();
                  if (userCredential != null) {
                    Navigator.pushReplacement(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  } else {
                    print('Sign in failed');
                  }
                } catch (e) {
                  print('Error signing in with Google: $e');
                }
              },
            ),
          ]
        ),
      )
    );
  }
}
