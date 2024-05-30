import 'package:clapapp/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

checkUserLoginStatus() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;

  if (user != null) {
    goToLogin;
  } else {
    goToLogin; //SUPPOSE SIGN UP
  }
}
