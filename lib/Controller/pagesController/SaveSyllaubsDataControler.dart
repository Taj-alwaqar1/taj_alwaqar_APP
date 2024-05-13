import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/AuthenticateAcc/AuthenticateAcc.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';
import '../sharedController/homeListController.dart';

class CreateSylaubsController extends GetxController {
  final GlobalKey<FormState> CreateSylaubsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> CreateSylaubsFormKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> CreateSylaubsFormKey1 = GlobalKey<FormState>();

  final RxList<TextEditingController> SylabusDaysController =
      <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;
  final RxList<TextEditingController> NameOfSurahController =
      <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;
  final RxList<TextEditingController> StartVerseController =
      <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;
  final RxList<TextEditingController> EndVerseController =
      <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;

  var Syllabus = [].obs;

  bool isLoading = false;

  bool isVisibile = true;

  @override
  void dispose() {
    for (var i = 0; i < SylabusDaysController.length; i++) {
      SylabusDaysController[i].dispose();
      NameOfSurahController[i].dispose();
      StartVerseController[i].dispose();
      EndVerseController[i].dispose();
    }
    super.dispose();
  }

  loading() {
    isLoading = !isLoading;
  }

  String? validateDaysAndNumOfVerse(String value) {
    if (value.isEmpty ||
        !RegExp(r'^(?:[+]*[(]{0,1}[0-9]{1,2}[)]{0,1}[\.\/0-9]+|287|\d)$')
            .hasMatch(value)) {
      loading();
      return "Invalid number";
    }
    return null;
  }

  String? ValidateTexfFeild(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[\p{L}a-zA-Z0-9_-\u0600-\u06FF]{2,15}$', unicode: true)
            .hasMatch(value)) {
      loading();
      return "Enter correct Name";
    }
    return null;
  }

  void saveDataAndNavigate() async {
    final SyllabusInfo = CreateSylaubsFormKey.currentState!.save();
  }

  addMembertoSyllabus() {
    try {
      Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[0].text ?? 'xxx',
      nameOfSurah: NameOfSurahController[0].text ?? 'xxx',
      StartVerse: int.parse(StartVerseController[0].text),
      EndVerse: int.parse(EndVerseController[0].text),
    ));
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[1].text ?? '',
      nameOfSurah: NameOfSurahController[1].text ?? '',
      StartVerse: int.parse(StartVerseController[1].text),
      EndVerse: int.parse(EndVerseController[1].text),
    ));
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[2].text ?? '',
      nameOfSurah: NameOfSurahController[2].text ?? '',
      StartVerse: int.parse(StartVerseController[2].text),
      EndVerse: int.parse(EndVerseController[2].text),
    ));
    } catch (e) {
      Get.snackbar("error", "add Syllabus for halaqh");
    }
    
  }

  void checkCreateSyllabus() async {
    final isValid = CreateSylaubsFormKey.currentState!.validate();
    final isValid1 = CreateSylaubsFormKey1.currentState!.validate();
    final isValid2 = CreateSylaubsFormKey2.currentState!.validate();
    if (isValid&&isValid1&&isValid2) {
      CreateSylaubsFormKey.currentState!.save();
    navigator?.pop();
    } else {
      Get.snackbar(
        "Error",
        " Please enter value",
        duration: Duration(seconds: 2),
      );
    }
  }
 }

class SyllabusInfo {
  String SyllabusDays;
  String nameOfSurah;
  int StartVerse;
  int EndVerse;
  SyllabusInfo({
    required this.SyllabusDays,
    required this.nameOfSurah,
    required this.StartVerse,
    required this.EndVerse,
  });
  factory SyllabusInfo.fromMap(Map<String, dynamic> map) {
    return SyllabusInfo(
      SyllabusDays: map['day'] ?? '',
      nameOfSurah: map['nameOfSurah'] ?? '',
      StartVerse: map['StartVerse'] ?? '',
      EndVerse: map['EndVerse'] ?? '',
    );
  }

  Map<String, dynamic> convetToMap() {
    return {
      'SyllabusDays': SyllabusDays,
      'nameOfSurah': nameOfSurah,
      'StartVerse': StartVerse,
      'EndVerse': EndVerse,
    };
  }
}
