import 'package:frist_file_taj_alwaqar/view/Shared/DropMenu.dart';
import 'package:get/get.dart';

class DropMenuController extends GetxController {
  RxString initvalue = "مستوى الطالب".obs;
  RxString initvalue1 = " أيام الحلقة".obs;
  RxString initvalue2 = " وقت الحلقة".obs;
  List days = ['الاحد', 'الاثنين', 'الثلاثاء', 'الاربعاء', 'الخميس'];

  void changeinitvalue(value) {
    initvalue.value = value;
  }

  void changeinitvalue1(value) {
    initvalue1.value = value;
  }

  void changeinitvalue2(value) {
    initvalue2.value = value;
  }
}
