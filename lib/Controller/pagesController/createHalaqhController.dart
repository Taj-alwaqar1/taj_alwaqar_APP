import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
// import 'package:frist_file_taj_alwaqar/Model/createHalaqhModel.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:get/get.dart';

import '../../Model/sendDataToStore/SendUserData.dart';
import '../../Model/sendDataToStore/createHalaqhModel.dart';
import 'SaveSyllaubsDataControler.dart';

class HalaqhController extends GetxController {
  final GlobalKey<FormState> HalaqhFormKey = GlobalKey<FormState>();

  final mosqueNameController = TextEditingController();
  final halqahNameController = TextEditingController();
  final teacherNameController = TextEditingController();
  final halaqhDaysController = TextEditingController();
  final halqahTimeController = TextEditingController();
  final locationController = TextEditingController();
  final createSyllabusController = TextEditingController();
  final RxBool createSylaubus = false.obs;

  final HalaqhData sendHalaqhInfo = Get.put(HalaqhData());

  CreateSylaubsController CreateSylaubscontroller  = Get.put(CreateSylaubsController());

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
      // SendDateToModel();
    } else {
      Get.snackbar(
        "Error",
        "Please fix the errors in the form",
        duration: Duration(seconds: 2),
      );
    }
  }

  SendDateToModel() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    halaqh halqhData = halaqh(
      // createSyllabusController.text,
      mosqueName: mosqueNameController.text,
      halqahName: halqahNameController.text,

      teacherName: teacherNameController.text,

      halaqhDays: halaqhDaysController.text,

      halqahTime: halqahTimeController.text,

      teacheruid: uid,
      //  Syllabus: [
      //   CreateSylaubscontroller.Syllabus[0],
      //   CreateSylaubscontroller.Syllabus[1],
      //   CreateSylaubscontroller.Syllabus[2],
      //  ],
       
    );
    CreateSylaubscontroller. addMembertoSyllabus();
    sendHalaqhInfo.createHalaqh(halqhData);
    // await getinfo.getUsername();
  }
}

class halaqh {
  //  mosqueNameController.text,
  //     halqahNameController.text,
  //     teacherNameController.text,
  //     halaqhDaysController.text,
  //     halqahTimeController.text,
  //     locationController.text,
  //     createSyllabusController.text,
  String mosqueName;
  String halqahName;
  String teacherName;
  String halaqhDays;
  String halqahTime;
  String teacheruid;
  // List Syllabus;
  // String mosqueName;
  // String createSyllabus;
  halaqh({
    required this.mosqueName,
    required this.halqahName,
    required this.teacherName,
    required this.halaqhDays,
    required this.halqahTime,
    // required this.createSyllabus,
    required this.teacheruid,
    // required this.Syllabus,
  });
  Map<String, dynamic> toMap() {
    return {
      'mosqueName': mosqueName,
      'halqahName': halqahName,
      'teacherName': teacherName,
      'halaqhDays': halaqhDays,
      'halqahTime': halqahTime,
      // 'createSyllabus': createSyllabus,
      'teacheruid': teacheruid,
      // 'Syllabus':Syllabus,
    };
  }

  factory halaqh.fromMap(Map<String, dynamic> map) {
    return halaqh(
      mosqueName: map['mosqueName'] ?? '',
      halqahName: map['halqahName'] ?? '',
      teacherName: map['teacherName'] ?? '',
      halaqhDays: map['halaqhDays'] ?? '',
      halqahTime: map['halqahTime'] ?? '',
      // createSyllabus: map['createSyllabus'] ?? '',
      teacheruid: map['teacheruid'] ?? '',
      // Syllabus:map['Syllabus']??'',
    );
  }
}
// class Sylabus {
//   String day;
//   String nameOfSurah;
//   String StartVerse;
//   String EndVerse;
//   Sylabus({
//     required this.day,
//     required this.nameOfSurah,
//     required this.StartVerse,
//     required this.EndVerse,
//   });
//     Map<String, dynamic> toMap() {
//     return {
//       'day': day,
//       'nameOfSurah': nameOfSurah,
//       'StartVerse': StartVerse,
//       'EndVerse': EndVerse,
//     };
    
//   }
//   factory Sylabus.fromMap(Map<String, dynamic> map) {
//     return Sylabus(
//       day: map['day'] ?? '',
     
//       nameOfSurah: map['nameOfSurah'] ?? '',
//       StartVerse: map['StartVerse'] ?? '',
//       EndVerse: map['EndVerse'] ?? '',
//     );
//   }

// }