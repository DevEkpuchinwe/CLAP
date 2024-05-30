import 'dart:developer';

import 'package:clapapp/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<Object?> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await cred.user!.updateDisplayName(name);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'THE PASSWORD PROVIDED IS TOO WEAK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      if (e.code == 'email-already-in-use') {
        return Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: const Text(
              'ACCOUNT ALREADY EXISTS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            action: SnackBarAction(
                label: 'LOGIN',
                onPressed: () {
                  goToLogin;
                }),
            shape: const RoundedRectangleBorder(),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(20),
          ),
        );
      }
      if (e.code == 'invalid-email') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'INVALID EMAIL ADDRESS PROVIDED',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      if (e.code == 'operation-not-allowed') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'OPERATION NOT ALLOWED',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      //log("Something went wrong");
    }
    return null;
  }

  Future<Object?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'USER NOT FOUND',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      if (e.code == 'user-disabled') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'ACCOUNT DISABLED. CONTACT CUSTOMER CARE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      if (e.code == 'invalid-email') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'INVALID EMAIL ADDRESS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      if (e.code == 'wrong-password') {
        return const Align(
          alignment: Alignment.topCenter,
          child: SnackBar(
            content: Text(
              'WRONG PASSWORD. TRY ANOTHER PASSWORD',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
          ),
        );
      }
      //log("Something went wrong");
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      return log('SOMETHING WENT WRONG');
    }
  }
}

goToLogin(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
