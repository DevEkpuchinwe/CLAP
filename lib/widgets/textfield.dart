//import 'package:clapapp/auth/validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    this.controller,
    this.isPassword = false,
  });
  //this.validator});
  final String hint;
  final String label;
  final bool isPassword;
  //final Validator? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          errorText: label,
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          label: Text(label),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey, width: 1))),
    );
  }
}
