// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:get/get.dart';

class AuthenticateLogIn extends GetxController {
  late String messageErrorLogin;
  LogInAcc(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", "Email or password wrong");
      print(e.toString());
    }
  }
}
