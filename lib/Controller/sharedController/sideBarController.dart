import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetStudentData/getStudentData.dart';

class sideBarController extends GetxController {
  final GetData getStudentsDataModel = Get.put(GetData());

  String get username {
getStudentsDataModel.getStudentsData();
  getStudentsDataModel.getUsername();
  update();
    return getStudentsDataModel.username;
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => Login());
  }
}
