import 'package:get/get.dart';

import '../../view/Pages/TeacherDetail.dart';

class TeacherController extends GetxController {
   RxString Name = "".obs;

  void navigateToTeacherDetail(String teacherName) {
    Name.value = teacherName;
   
    update();
    Get.to(()=>TeacherDetail());
  }
}
