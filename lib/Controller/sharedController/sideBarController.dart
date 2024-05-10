import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';

class sideBarController extends GetxController {
  final GetData getStudentsDataModel = Get.put(GetData());
  SendStdData sendstdData = Get.put(SendStdData());
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  RxString get username => getStudentsDataModel.username;

  RxString get firstname => getStudentsDataModel.firstname;
  RxString get email => getStudentsDataModel.email;
  RxString get phonenumber => getStudentsDataModel.phonenumber;

  void fetchUsername() async {
    await getStudentsDataModel.getUsername();
  }

  updateFirebaseValue(firstname, email, phonenumber) async {
    await sendstdData.updateFirebaseValue(firstname, email, phonenumber);
    await getUserAttributes();
  }

  bool isLoading = false;

  bool isVisibile = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstnameController.dispose();
    emailController.dispose();
    phonenumberController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsername();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      loading();
      return "Provide valid Email";
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

  String? ValidateNumFeild(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-s\.\/0-9]+$')
            .hasMatch(value)) {
      loading();
      return "Enter correct number";
    }
    return null;
  }

  loading() {
    isLoading = !isLoading;
  }

  getUserAttributes() {
    getStudentsDataModel.getUserAttributes();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => Login());
  }
}