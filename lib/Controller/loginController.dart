import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInController extends GetxController{
  final UserNameController = TextEditingController();
  final fristNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final levelOfStdController = TextEditingController();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  final Future<SharedPreferences>_pref=SharedPreferences.getInstance();
  // Future<Void> registerWithEmail()async{
  //   Map userInfo={
  //     'username':UserNameController.text,
  //     'fristname':fristNameController.text,
  //     'lastname':lastNameController.text,
  //     'age':ageController.text,
  //     'phoneNumber':phoneNumberController.text,
  //     'levelOfStd':levelOfStdController.text,
  //     'email':emailController.text.trim(),
  //     'password':PasswordController.text,
  //   };
  }