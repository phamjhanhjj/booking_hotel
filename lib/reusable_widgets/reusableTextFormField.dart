import 'package:flutter/material.dart';

Widget reusableTextFormField(
    String text,
    IconData icon,
    bool isPasswordType,
    TextEditingController controller,
    String? Function(String?)? validator) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    decoration: InputDecoration(
      labelText: text,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    validator: validator, 
  );
}
