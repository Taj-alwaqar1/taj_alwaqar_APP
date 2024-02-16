import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Controller/Login&signincontroller/SigninController.dart';

class AuthenticateSignin extends GetxController {
  late String messageErrorSignin;



  registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("error", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("error", "The account already exists for that email.");
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }
}
