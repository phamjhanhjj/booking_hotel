import 'package:flutter/material.dart';
import 'Utils.dart';
import 'form_header_widget.dart';
import '../../utilities/constants.dart';
import 'send_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPhone extends StatefulWidget {
  const ForgotPasswordPhone({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPhoneScreen createState() => _ForgotPasswordPhoneScreen();
}

class _ForgotPasswordPhoneScreen extends State<ForgotPasswordPhone> {
  final phoneController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  bool isValidPhoneNumber(String? input) {
    final RegExp regex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return (input != null && regex.hasMatch(input));
  }

  void verifyPhone() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Utils.showSnackBar('The provided phone number is not valid', context);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyOtp(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const SizedBox(height: tDefaultSize*4),
              const FormHeaderWidget(
                image: tForgetPasswordImage,
                title: tForgetPasswordTitle1,
                subTitle: tForgetPasswordSubTitle1,
                crossAxisAlignment:  CrossAxisAlignment.center,
                heightBetween: 30,
                textAlign:  TextAlign.center,
              ),
              const SizedBox(height: tFromHeight),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        label: Text(tPhone),
                        hintText: tPhone,
                        prefixIcon: Icon(Icons.phone, color: Colors.white),
                      ),
                      validator: (phone) => 
                        phone != null && !isValidPhoneNumber(phone)
                          ? 'Enter a valid phone'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 16, 90, 168)),
                        ),
                        onPressed: verifyPhone,
                        child: const Text(
                          tNext,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        )
                      )
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}