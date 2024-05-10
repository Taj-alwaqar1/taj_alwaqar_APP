// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/loginAcc.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:get/get.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/SigninController.dart';

import '../../Model/GetUserData/getStudentData.dart';

class LogInController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final EmailController = TextEditingController();
  final passwordController = TextEditingController();

  GetData getinfo = Get.put(GetData());
  bool isLoading = false;

  bool isVisibile = true;

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

  checkLogIn() async {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      AuthenticateLogInController.LogInAcc(
          EmailController.text, passwordController.text);
      loginFormKey.currentState!.save();
      await getinfo.getUsername();
    } else {
      Get.snackbar(
        "error",
        "insert Some Value",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loading();
    }
  }

  Visibile() {
    isVisibile = !isVisibile;
    update();
  }
}
