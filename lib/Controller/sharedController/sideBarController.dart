import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getStudentData.dart';

class sideBarController extends GetxController {
  final GetData getStudentsDataModel = Get.put(GetData());

  RxString get username => getStudentsDataModel.username;

  void fetchUsername() async {
    await getStudentsDataModel.getUsername();
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsername();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => Login());
  }
}
