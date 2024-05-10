import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Model/GetUserData/GetTeacherData.dart';
// import 'package:frist_file_taj_alwaqar/Model/createHalaqhModel.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../Model/GetUserData/getHalaqhinfo.dart';
import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';
import '../../Model/sendDataToStore/createHalaqhModel.dart';
import '../../view/Pages/ChatGroupScr.dart';
import '../sharedController/botoomNavController.dart';
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

  final GetHalaqhInfo getHalaqhInfo = Get.put(GetHalaqhInfo());
  final SendStdData SendStddata = Get.put(SendStdData());
  final GetData Getdata = Get.put(GetData());

  CreateSylaubsController CreateSylaubscontroller =
      Get.put(CreateSylaubsController());

  RxString currenthalaqhName = ''.obs;
  RxString currenthalaqhId = ''.obs;
  String halaqhnameee = '';
  // GetData getinfo = Get.put(GetData());
  bool isLoading = false;

  bool isVisibile = true;

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  final bottomNavnController controllernav = Get.put(bottomNavnController());

  goToChatScreen() async {
//  await controllernav.changepageindex(5); /
    controllernav.currentpage.value = 4;
    controllernav.pageControllerindex = PageController(initialPage: 4);
    Get.offAll(()=>userScreen());
  }

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

  RxList<String> get HalaqhNames => getHalaqhInfo.HalaqhNames.value;

  RxList<String> get TeacherNames => getHalaqhInfo.TeacherNames.value;

  RxList<String> get halaqhDays => getHalaqhInfo.halaqhDays.value;

  RxString get GroupUid => Getdata.groupUid;

  String get HalaqhName => getHalaqhInfo.halaqhName;

  String get mosqueName => getHalaqhInfo.mosqueName.value;

  RxList<String> get Halaqhids => getHalaqhInfo.Halaqhids.value;

  getHalaqhNames() {
    getHalaqhInfo.getHalaqhNames();
  }

  getHalaqhids() {
    getHalaqhInfo.getHalaqhids();
  }

  getTeacherNames() {
    getHalaqhInfo.getTeacherNames();
  }

  gethalaqhDays() {
    getHalaqhInfo.gethalaqhDays();
  }

  ReturnMosqueName(currenthalaqhId) async {
    await getHalaqhInfo.ReturnMosqueName(currenthalaqhId);
  }

  SendDateToModel() async {
     

    var groupId = '${DateTime.now().millisecondsSinceEpoch}_${randomString(8)}';
    currenthalaqhId.value = groupId;
    final auth = FirebaseAuth.instance;
    List<String> uids = [];

    halaqh halqhData = halaqh(
      mosqueName: mosqueNameController.text,
      halqahName: halqahNameController.text,
      teacherName: teacherNameController.text,
      halaqhDays: halaqhDaysController.text,
      halqahTime: halqahTimeController.text,
      teacheruid: uid,
      senderId: uid,
      groupId: groupId,
      lastMessage: '',
      membersUid: [auth.currentUser!.uid, ...uids],
      timeSent: DateTime.now(),
    );
    CreateSylaubscontroller.addMembertoSyllabus();

    sendHalaqhInfo.createHalaqh(halqhData);
  }

String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    final stringBuffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      stringBuffer.write(chars[random.nextInt(chars.length)]);
    }
    return stringBuffer.toString();
  }

  getvalueAndGoToChatGroup(halaqhid, halaqhname) {
    currenthalaqhId.value = halaqhid;
    currenthalaqhName.value = halaqhname;
  }

  addUserToGroup(groupId, userId) {
    sendHalaqhInfo.addUserToGroup(groupId, userId);
  }

  addGroupUidToFirestore(userId, groupId) {
    SendStddata.addGroupUidToFirestore(userId, groupId);
  }

  checkAndReturnGroupUid() {
    Getdata.checkAndReturnGroupUid();
  }

  GiveHalaqhIdValue() {
    // print('=====================${GroupUid.value}');s
    if (currenthalaqhId.value.isEmpty) {
      currenthalaqhId.value = GroupUid.value;
    }

// GroupUid
  }

  GiveHalaqhIdValue22(group) {
    // print('=====================${GroupUid.value}');s
    currenthalaqhId.value = group;
    GroupUid.value = group;
// GroupUid
  }

  GetHalaqhName(currenthalaqhId) async {
// await checkAndReturnGroupUid();
    currenthalaqhName.value =
        await getHalaqhInfo.ReturnHalaqhName(currenthalaqhId);
  }

  final endVerses = RxList<int>([]).obs;
  final startVerses = RxList<int>([]).obs;
  final syllabusDays = RxList<String>([]).obs;
  final nameOfSurah = RxList<String>([]).obs;

  Future<void> displaySyllabuses(halaqahGroupId) async {
    final syllabuses = await getHalaqhInfo.getAllSyllabus(halaqahGroupId);

    if (syllabuses.isNotEmpty) {
      for (final syllabus in syllabuses) {
        final endVerse = syllabus['EndVerse'];
        final startVerse = syllabus['StartVerse'];

        if (endVerse != null && startVerse != null) {
          endVerses.value.add(endVerse);
          startVerses.value.add(startVerse);
          syllabusDays.value.add(syllabus['SyllabusDays']);
          nameOfSurah.value.add(syllabus['nameOfSurah']);
        }
      }
    } else {
      print('No syllabuses found for the Halaqah group.');
    }
  }
}

class halaqh {
  final String mosqueName;
  final String halqahName;
  final String teacherName;
  final String halaqhDays;
  final String halqahTime;
  final String teacheruid;
  final String senderId;
  final String groupId;
  final String lastMessage;
  final List<String> membersUid;
  final DateTime timeSent;

  halaqh({
    required this.mosqueName,
    required this.halqahName,
    required this.teacherName,
    required this.halaqhDays,
    required this.halqahTime,
    required this.teacheruid,
    required this.senderId,
    required this.groupId,
    required this.lastMessage,
    required this.membersUid,
    required this.timeSent,
  });
  Map<String, dynamic> toMap() {
    return {
      'mosqueName': mosqueName,
      'halqahName': halqahName,
      'teacherName': teacherName,
      'halaqhDays': halaqhDays,
      'halqahTime': halqahTime,
      'teacheruid': teacheruid,
      'senderId': senderId,
      'groupId': groupId,
      'lastMessage': lastMessage,
      'membersUid': membersUid,
      'timeSent': timeSent.millisecondsSinceEpoch,
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
      senderId: map['senderId'] ?? '',
      groupId: map['groupId'] ?? '',
      lastMessage: map['lastMessage'] ?? '',
      // groupPic: map['groupPic'] ?? '',
      membersUid: List<String>.from(map['membersUid']),
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
    );
  }
}
