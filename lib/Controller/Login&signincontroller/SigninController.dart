import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetStudentData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';

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

  final SendStdData sendUserinfo = Get.put(SendStdData());


GetData getinfo= Get.put(GetData());
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

  String? ValidateUserNameFeild(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$').hasMatch(value)) {
      loading();
      return "Enter correct usernam";
    }
    return null;
  }

  String? ValidateAgeFeild(String value) {
    if (value.isEmpty || !RegExp(r'^\d{1,2}$').hasMatch(value)) {
      loading();
      return "Enter correct usernam";
    }
    return null;
  }

  String? ValidateNumFeild(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-s\.\/0-9]+$')
            .hasMatch(value)) {
      loading();
      return "Enter correct number";
    }
    return null;
  }

  String? ValidateTexfFeild(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      loading();
      return "Enter correct Name";
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
      SendDateToModel();
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

  getlevelStd(newValue) {
    levelOfStdController.text = newValue;
  }

  SendDateToModel() async{
    sendUserinfo.addUser(
      UserNameController.text,
      fristNameController.text,
      lastNameController.text,
      ageController.text,
      phoneNumberController.text,
      levelOfStdController.text,
      emailController.text,
      passwordController.text,
    );
    await getinfo.getUsername();
    Get.off(()=>Login());
  }
}
