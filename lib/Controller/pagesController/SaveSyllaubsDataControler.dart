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

  var Syllabustest = [].obs;




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

  void saveDataAndNavigate() async {
    final SyllabusInfo = CreateSylaubsFormKey.currentState!.save();
  }

  addMembertoSyllabus() {
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[0].text ?? 'xxx',
      nameOfSurah: NameOfSurahController[0].text ?? 'xxx',
      StartVerse:int.parse( StartVerseController[0].text??"0") ,
      EndVerse:int.parse(  EndVerseController[0].text??"0"),
    ));
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[1].text ?? '',
      nameOfSurah: NameOfSurahController[1].text ?? '',
      StartVerse: int.parse( StartVerseController[1].text??"0"),
      EndVerse:int.parse(  EndVerseController[1].text??"0"),
    ));
    Syllabus.add(SyllabusInfo(
      SyllabusDays: SylabusDaysController[2].text ?? '',
      nameOfSurah: NameOfSurahController[2].text ?? '',
      StartVerse: int.parse( StartVerseController[2].text??"0"),
      EndVerse: int.parse(  EndVerseController[2].text??"0"),
    ));
  }

 addMembertoSyllabustest(add) {
   Syllabustest.add(add[0]);
   Syllabustest.add(add[1]);
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
