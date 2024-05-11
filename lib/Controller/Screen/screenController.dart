import 'package:get/get.dart';

import '../../Model/GetUserData/GetTeacherData.dart';

class ScreenController extends GetxController {
  final getTeacherData = Get.put(GetTeacherData());
  @override
  void onInit() async {
    super.onInit();
    await getTeacherData.getUserType();
  }

  RxBool get userType => getTeacherData.userType;
}
