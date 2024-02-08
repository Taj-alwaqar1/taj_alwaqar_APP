import 'dart:ffi';

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


  final AuthenticateSignin Authenticatecontroller =Get.put(AuthenticateSignin());

   void signIn() {
  String email = emailController.text;
  String password = passwordController.text;
  Authenticatecontroller.registerUser(email, password);
}}