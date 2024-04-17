import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/ItemHomeTec.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getHalaqhinfo.dart';
import '../../view/Pages/TeacherDetail.dart';

class HomeTeacherController extends GetxController {
  // late String halaqhName, stdName;
  final GetHalaqhInfo getHalaqhInfo = Get.put(GetHalaqhInfo());

    @override
  void onInit() async {
    super.onInit();
    await getOwnHalaqhNames();
  }

  getOwnHalaqhNames() {
    getHalaqhInfo.getOwnHalaqhNames();
  }

  RxList<String> get OwnHalaqh => getHalaqhInfo.OwnHalaqh.value;


  RxList<String> get OwnHalaqhids => getHalaqhInfo.OwnHalaqhids.value;

  RxList<String> get memberNames => getHalaqhInfo.memberNames.value;


getMemberIDs(docID)async{
 await getHalaqhInfo.getMemberIDs(docID);
    getHalaqhInfo.memberIDs.value.forEach((memberID) {
    print(memberID);
  });
await getHalaqhInfo.getMemberNames(getHalaqhInfo.memberIDs.value);
 getHalaqhInfo.memberNames.value.forEach((memberName) {
    print(memberName);
  });
}
ClearmemberNames(){
  getHalaqhInfo.memberNames.value.clear();
  getHalaqhInfo.memberIDs.value.clear();
}


}
