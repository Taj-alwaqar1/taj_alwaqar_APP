// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/loginAcc.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();

   bool isLoading=false;

    final AuthenticateLogIn AuthenticateLogInController =
      Get.put(AuthenticateLogIn());

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }
    loading() {
    isLoading = !isLoading;
    update();
  }

  @override
  void dispose() {
    EmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

     checkLogIn() {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
       AuthenticateLogInController.LogInAcc(EmailController.text, passwordController.text); 
      loginFormKey.currentState!.save(); 
    
    } else {
      Get.snackbar("error", "insert Some Value");
      loading();
    }
     
  }
}