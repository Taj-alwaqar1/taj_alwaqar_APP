import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:frist_file_taj_alwaqar/Controller/HalaqhController/createHalaqhController.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

class HalaqhData extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // final HalaqhController controllerHalaqh = Get.put(HalaqhController());

  Future<void> createHalaqh(
    String mosqueName,
    String halqahName,
    String teacherName,
    String halaqhDays,
    String halqahTime, // ??
    String location,
    String createSyllabus, //??
  ) async {
    final user = _auth.currentUser;
    final uid = user!.uid;
    final halaqh = _firestore.collection('halaqh').doc(uid);
    try {
      await halaqh.set({
        "mosqueName": mosqueName,
        "halqahName": halqahName,
        "teacherName": teacherName,
        "halaqhDays": halaqhDays,
        "halqahTime": halqahTime,
        "location": location,
        "createSyllabus": createSyllabus,
        "uid": uid,
      });
      print('Halaqh added successfully!');
      // Get.off(() => DisplayHalaqh());
    } catch (error) {
      print('Faild to create halaqh: $error');
    }
  }

  // Future<void> addHalaqh() {
  //   return halaqh.add({
  //     "mosqueName": controllerHalaqh.mosqueNameController,
  //     "halqahName": controllerHalaqh.halqahNameController,
  //     "teacherName": controllerHalaqh.teacherNameController,
  //     "halaqhDays": controllerHalaqh.halaqhDaysController,
  //     "halqahTime": controllerHalaqh.halqahTimeController,
  //     "location": controllerHalaqh.locationController,
  //     "createSyllabus": controllerHalaqh.createSyllabusController,
  //   })
  //   .then((value) => print("Halaqh added successfully!"))
  //   .catchError((error)=> print("Faild to create halaqh: $error"));

  // }
}
