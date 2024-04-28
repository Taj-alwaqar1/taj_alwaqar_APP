import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';

class sideBarController extends GetxController {
  final GetData getStudentsDataModel = Get.put(GetData());
  SendStdData sendstdData = Get.put(SendStdData());

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
  updateFirebaseValue(firstname,email,phonenumber){
    sendstdData.updateFirebaseValue(firstname, email, phonenumber);
  }
  @override
  void onInit() {
    super.onInit();
    fetchUsername();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => Login());
  }
}
