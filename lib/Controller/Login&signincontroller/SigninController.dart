import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final UserNameController = TextEditingController();
  final fristNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final levelOfStdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthenticateSignin Authenticatecontroller =
      Get.put(AuthenticateSignin());

  bool isLoading = false;

  bool isVisibile = true;

  @override
  void dispose() {
    UserNameController.dispose();
    fristNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
    levelOfStdController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      loading();
      return "Provide valid Email";
      
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      loading();
      return "Password must be of 8 characters";
    }
    return null;
  }

  void checkSignin() async {
    final isValid = signinFormKey.currentState!.validate();
    if (isValid) {
      signinFormKey.currentState!.save();
      await Authenticatecontroller.registerUser(
          emailController.text, passwordController.text);
     Get.off(() => Login());
    } else
      Get.snackbar("error", Authenticatecontroller.messageErrorSignin);

    return;
  }

  Visibile() {
    isVisibile = !isVisibile;
    update();
  }

  loading() {
    isLoading = !isLoading;
  }
}
