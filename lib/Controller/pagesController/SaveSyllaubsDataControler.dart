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

  final SylabusDaysController = TextEditingController();
  final VerseNameController = TextEditingController();
  final StartVerseController = TextEditingController();
  final EndVerseController = TextEditingController();

  @override
  void dispose() {
    SylabusDaysController.dispose();
    VerseNameController.dispose();
    StartVerseController.dispose();
    EndVerseController.dispose();
    super.dispose();
  }

  void saveDataAndNavigate() async {
    final SylabusInfo = CreateSylaubsFormKey.currentState!.save();
  }
}

class SylabusInfo {
  String SylabusDays;
  String VerseName;
  String StartVerse;
  String EndVerse;

  SylabusInfo({
    required this.SylabusDays,
    required this.VerseName,
    required this.StartVerse,
    required this.EndVerse,
  });

  Map<String, dynamic> convetToMap() {
    return {
      'SylabusDays': SylabusDays,
      'VerseName': VerseName,
      'StartVerse': StartVerse,
      'EndVerse': EndVerse,
    };
  }
}
