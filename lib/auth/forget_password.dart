import 'dart:developer';

import 'package:clapapp/auth/auth_service.dart';
import 'package:clapapp/auth/confirm_email.dart';
//import 'package:clapapp/auth/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password';
  final String message =
      'An Email Has Just Been Sent To You, Click The Link Provided To Complete Password Reset';

  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  late String _email;

  _passwordReset() async {
    try {
      _formKey.currentState!.save();
      await _auth.sendPasswordResetEmail(email: _email);

      if (!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ConfirmEmail(
          message: widget.message,
        );
      }));
    } catch (e) {
      log('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter Your Email',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              TextFormField(
                //validator: Validator.validateEmail(email: _email),
                onSaved: (newEmail) => _email = newEmail!,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail_rounded,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _passwordReset();
                },
                child: const Text('Send Email'),
              ),
              ElevatedButton(
                  onPressed: () {
                    goToLogin(context);
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
