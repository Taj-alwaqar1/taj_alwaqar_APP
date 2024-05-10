import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';
import '../sharedController/homeListController.dart';

class SigninController extends GetxController {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final UserNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final levelOfStdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthenticateSignin Authenticatecontroller =
      Get.put(AuthenticateSignin());

  final SendStdData sendUserinfo = Get.put(SendStdData());

  GetData getinfo = Get.put(GetData());
  RxBool isLoading = false.obs;

  RxBool isVisibile = true.obs;

  @override
  void dispose() {
    UserNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    phoneNumberController.dispose();
    levelOfStdController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

//must be arbic litter
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? ValidateUserNameFeild(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$').hasMatch(value)) {
      return "Enter correct usernam";
    }
    return null;
  }

  String? ValidateAgeFeild(String value) {
    if (value.isEmpty || !RegExp(r'^\d{1,2}$').hasMatch(value)) {
      return "Enter correct usernam";
    }
    return null;
  }

  String? ValidateNumFeild(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-s\.\/0-9]+$')
            .hasMatch(value)) {
      return "Enter correct number";
    }
    return null;
  }

  String? ValidateTexfFeild(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct Name";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  void checkSignin() async {
    final isValid = signinFormKey.currentState!.validate();
    if (isValid) {
      await Authenticatecontroller.registerUser(
          emailController.text, passwordController.text);
      signinFormKey.currentState!.save();
      SendDateToModel();
      loading();
    } else {
      Get.snackbar(
        "error",
        'insert some values',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      await loading();
    }
  }

  Visibile() {
    isVisibile.value = !isVisibile.value;
    update();
  }

  loading() {
    isLoading.value = !isLoading.value;
  }

  getlevelStd(newValue) {
    levelOfStdController.text = newValue;
  }

  SendDateToModel() async {
    sendUserinfo.addUser(
        UserNameController.text,
        firstNameController.text,
        lastNameController.text,
        ageController.text,
        phoneNumberController.text,
        levelOfStdController.text,
        emailController.text,
        passwordController.text,
        '');
    await getinfo.getUsername();
  }
}

class userInfo {
  String uid;
  String username;
  String firstname;
  String lastname;
  String age;
  String phonenumber;
  String levelstd;
  String email;
  String groupUid;
  String password;

  userInfo({
    required this.uid,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.phonenumber,
    required this.levelstd,
    required this.email,
    required this.password,
    required this.groupUid,
  });
    factory userInfo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    return userInfo(
      uid: data?['uid'] ?? '',
      username: data?['username'] ?? '',
      firstname: data?['firstname'] ?? '',
      lastname: data?['lastname'] ?? '',
      age: data?['age'] ?? '',
      phonenumber: data?['phonenumber'] ?? '',
      levelstd: data?['levelstd'] ?? '',
      email: data?['email'] ?? '',
      password: data?['password'] ?? '',
      groupUid: data?['groupUid'] ?? '',
    );}

  Map<String, dynamic> convetToMap() {
    return {
      'uid': uid,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'phonenumber': phonenumber,
      'levelstd': levelstd,
      'email': email,
      'password': password,
      'groupUid': groupUid,
    };
  }
}
