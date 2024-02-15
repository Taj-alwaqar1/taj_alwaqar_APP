import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class HomeListController extends GetxController {
  //الفكره هنا اذا المعلم انشئ حلقة المفروض تنعرض بي صفحة الهوم
  List<QueryDocumentSnapshot> teacherList = [];
  getDataTeacherList() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Teacher").get();
    teacherList.addAll(querySnapshot.docs);
  }
}
