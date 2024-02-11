import 'package:get/get.dart';

class DropMenuController extends GetxController{
  
  RxString initvalue = "مستوى الطالب".obs;

void changeinitvalue( value) {
  initvalue.value= value;

  
}
}