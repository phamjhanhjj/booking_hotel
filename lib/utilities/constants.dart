import 'package:flutter/material.dart';

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const double tFromHeight = 20;
const double tDefaultSize = 20.0;
const String tForgetPasswordTitle = 'Make Selections!';
const String tForgetPasswordSubTitle = 'Select the options below to reset your password';
const String tEmail = 'E-Mail';
const String tPhone = 'Phone';
const String tRestViaEMail = 'Reset via E-Mail Verification';
const String tRestViaPhone = 'Reset via Phone Verification';
const String tPhoneNo = 'Phone No';
const String tForgetPasswordImage = 'assets/images/forget_password.png';
const String tForgetPasswordTitle1 = 'Forget Password';
const String tForgetPasswordSubTitle1 = 'Select one of the options given below to reset your password.';
const String tNext = 'Reset Password';