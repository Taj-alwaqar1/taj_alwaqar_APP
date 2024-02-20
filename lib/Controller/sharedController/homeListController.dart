import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:get/get.dart';

import '../../Model/GetUserData/GetTeacherData.dart';

class HomeListController extends GetxController {
  final getTeacherData = Get.put(GetTeacherData());
  RxList<String> get teachersName => getTeacherData.teachersName.value;


  @override
  void onInit() async {
    super.onInit();
    await getTeacherData.getTeacherNames();
    update();
  }
}