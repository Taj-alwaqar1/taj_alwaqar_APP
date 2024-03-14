import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
// import 'package:frist_file_taj_alwaqar/Model/createHalaqhModel.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:get/get.dart';

import '../../Model/sendDataToStore/SendUserData.dart';
import '../../Model/sendDataToStore/createHalaqhModel.dart';

class HalaqhController extends GetxController {
  final GlobalKey<FormState> HalaqhFormKey = GlobalKey<FormState>();

  final mosqueNameController = TextEditingController();
  final halqahNameController = TextEditingController();
  final teacherNameController = TextEditingController();
  final halaqhDaysController = TextEditingController();
  final halqahTimeController = TextEditingController();
  final locationController = TextEditingController();
  final createSyllabusController = TextEditingController();
  // final AuthenticateSignin Authenticatecontroller =
  //     Get.put(AuthenticateSignin());

  final HalaqhData sendHalaqhInfo = Get.put(HalaqhData());

  // GetData getinfo = Get.put(GetData());
  bool isLoading = false;

  bool isVisibile = true;

  @override
  void dispose() {
    mosqueNameController.dispose();
    halqahNameController.dispose();
    teacherNameController.dispose();
    halaqhDaysController.dispose();
    halqahTimeController.dispose();
    locationController.dispose();
    createSyllabusController.dispose();
    super.dispose();
  }

  loading() {
    isLoading = !isLoading;
  }

  Visibile() {
    isVisibile = !isVisibile;
    update();
  }

  String? validateMosqueName(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$').hasMatch(value)) {
      loading();
      return "Mosque Name must be unique";
    }
    return null;
  }

  String? validateHalaqhName(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[a-zA-Z][a-zA-Z0-9_-]{2,15}$').hasMatch(value)) {
      loading();
      return "Halaqh Name must be unique";
    }
    return null;
  }

  void checkCreateHalaqh() async {
    final isValid = HalaqhFormKey.currentState!.validate();
    if (isValid) {
      HalaqhFormKey.currentState!.save();
      SendDateToModel();
    } else {
      Get.snackbar(
        "Error",
        "Please fix the errors in the form",
        duration: Duration(seconds: 2),
      );
    }
  }

  SendDateToModel() async {
    sendHalaqhInfo.createHalaqh(
      mosqueNameController.text,
      halqahNameController.text,
      teacherNameController.text,
      halaqhDaysController.text,
      halqahTimeController.text,
      locationController.text,
      createSyllabusController.text,
    );
    // await getinfo.getUsername();
  }
}
