import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
import 'package:get/get.dart';

class SigninController extends GetxController{
  final UserNameController = TextEditingController();
  final fristNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final levelOfStdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


   registerUser() async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    print("object");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}}