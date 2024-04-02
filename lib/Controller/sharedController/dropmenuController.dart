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

SigninController Signincontroller=Get.put(SigninController());

HalaqhController Halaqhcontroller=Get.put(HalaqhController());
  void changeinitvalue(value) {
    initvalue.value = value;
    //send value to model
  Signincontroller.levelOfStdController.value=value;


  }

//create halaqh
  void changeinitvalue1(value) {
    initvalue1.value = value;
    //send value to model
    Halaqhcontroller.halaqhDaysController.value=value;
  }

  void changeinitvalue2(value) {
    initvalue2.value = value;
    //send value to model
    Halaqhcontroller.halqahTimeController.value=value;

  }
}
