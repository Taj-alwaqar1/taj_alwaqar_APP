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

  // final SyllabusDaysController = TextEditingController();
  // final VerseNameController = TextEditingController();
  // final StartVerseController = TextEditingController();
  // final EndVerseController = TextEditingController();

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




  @override
  void dispose() {
    // SyllabusDaysController.dispose();
    // VerseNameController.dispose();
    // StartVerseController.dispose();
    // EndVerseController.dispose();
    super.dispose();
  }

  void saveDataAndNavigate() async {
    final SyllabusInfo = CreateSylaubsFormKey.currentState!.save();
  }

  addMembertoSyllabus() {
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[0].text ?? 'xxx',
      nameOfSurah: NameOfSurahController[0].text ?? 'xxx',
      StartVerse: StartVerseController[0].text ?? 'xxx',
      EndVerse: EndVerseController[0].text ?? 'xxxx',
    ));
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[1].text ?? '',
      nameOfSurah: NameOfSurahController[1].text ?? '',
      StartVerse: StartVerseController[1].text ?? '',
      EndVerse: EndVerseController[1].text ?? '',
    ));
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[2].text ?? '',
      nameOfSurah: NameOfSurahController[2].text ?? '',
      StartVerse: StartVerseController[2].text ?? '',
      EndVerse: EndVerseController[2].text ?? '',
    ));
  }
}

class SyllabusInfo {
  String SyllabusDays;
  String nameOfSurah;
  String StartVerse;
  String EndVerse;

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
