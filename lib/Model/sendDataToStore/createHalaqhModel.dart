import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/SaveSyllaubsDataControler.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/createHalaqhController.dart';
// import 'package:frist_file_taj_alwaqar/Controller/HalaqhController/createHalaqhController.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

class HalaqhData extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // final HalaqhController controllerHalaqh = Get.put(HalaqhController());
  CreateSylaubsController createSylaubscontroller =
      Get.put(CreateSylaubsController());

  Future<void> createHalaqh(halaqh HalaqhData) async {
    List<Map<String, dynamic>> syllabusData =
        createSylaubscontroller.Syllabus.map(
                (element) => element.convetToMap() as Map<String, dynamic>)
            .toList();
print(syllabusData.length);
    try {
      await firestore
          .collection('halaqh')
          .doc(HalaqhData.teacheruid)
          .set(HalaqhData.toMap());
      for (int i =0 ;i<syllabusData.length;i++) {
        await firestore
            .collection('halaqh')
            .doc(HalaqhData.teacheruid)
            .collection('Syllabus')
            .add(syllabusData[i]);
    }
  } catch (e) {
    Get.snackbar('Error sending halaqh or Syllabus data', e.toString());
  } 
    createSylaubscontroller.Syllabus.clear();
  syllabusData.clear();
}
// Future<void> sendSyllbus(SyllabusInfo Syllabus)async{
//    try {
//   await firestore
//           .collection('halaqh')
//           .doc(HalaqhData.teacheruid)
//           .collection('Syllabus')
//           .add(HalaqhData.toMap());}
//           catch(e){
//             Get.snackbar('error send halaqh data ', e.toString());
//           }
// }

  // Future<void> createHalaqh(
  //   String mosqueName,
  //   String halqahName,
  //   String teacherName,
  //   String halaqhDays,
  //   String halqahTime, // ??
  //   String location,
  //   String createSyllabus, //??
  // ) async {
  //   final user = _auth.currentUser;
  //   final uid = user!.uid;
  //   final halaqh = _firestore.collection('halaqh').doc(uid);
  //   try {
  //     await halaqh.set({
  //       "mosqueName": mosqueName,
  //       "halqahName": halqahName,
  //       "teacherName": teacherName,
  //       "halaqhDays": halaqhDays,
  //       "halqahTime": halqahTime,
  //       "location": location,
  //       "createSyllabus": createSyllabus,
  //       "uid": uid,
  //     });
  //     print('Halaqh added successfully!');
  //     // Get.off(() => DisplayHalaqh());
  //   } catch (error) {
  //     print('Faild to create halaqh: $error');
  //   }
  // }

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
