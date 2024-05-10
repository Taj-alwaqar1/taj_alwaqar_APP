import 'package:frist_file_taj_alwaqar/view/Shared/DropMenu.dart';
import 'package:get/get.dart';

import '../Login&signincontroller/SigninController.dart';
import '../pagesController/createHalaqhController.dart';

class DropMenuController extends GetxController {
  RxString initvalue = "مستوى الطالب".obs;
  RxString initvalue1 = " أيام الحلقة".obs;
  RxString initvalue2 = " وقت الحلقة".obs;
  List days = ['الاحد', 'الاثنين', 'الثلاثاء', 'الاربعاء', 'الخميس'];
//sign in

  SigninController Signincontroller = Get.put(SigninController());

  void changeinitvalue(value) {
    initvalue.value = value;
    Signincontroller.levelOfStdController.text = value;
  }

//create halaqh
  void changeinitvalue1(value) {
    initvalue1.value = value;
    HalaqhController Halaqhcontroller = Get.put(HalaqhController());

    //send value to model
    Halaqhcontroller.halaqhDaysController.text = value;
  }

  void changeinitvalue2(value) {
    initvalue2.value = value;
    HalaqhController Halaqhcontroller = Get.put(HalaqhController());

    //send value to model
    Halaqhcontroller.halqahTimeController.text = value;
  }
}
