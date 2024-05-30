import 'dart:developer';

//import 'package:clapapp/UI/homescreen.dart';
import 'package:clapapp/UI/homescreen.dart';
import 'package:clapapp/auth/auth_service.dart';
import 'package:clapapp/auth/forget_password.dart';
import 'package:clapapp/auth/signup_screen.dart';
import 'package:clapapp/navigationbar/navigator.dart';
//import 'package:clapapp/auth/validator.dart';
import 'package:clapapp/widgets/button.dart';
import 'package:clapapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            Form(
              child: CustomTextField(
                //validator: Validator.validateEmail(email: _email.text),
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              //validator: Validator.validatePassword(password: _password.text),
              hint: "Enter Password",
              label: "Password",
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Login",
              onPressed: _login,
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Forgot Password Your Password ?"),
              InkWell(
                onTap: () => goToPasswordReset(context),
                child: const Text("Reset", style: TextStyle(color: Colors.red)),
              )
            ]),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't Have An Account ? "),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Signup", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToNavigationBar(context);
    }
  }
}

goToPasswordReset(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPassword()),
    );

goToNavigationBar(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationScreen()),
    );
