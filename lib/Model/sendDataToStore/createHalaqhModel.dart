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

  Future createHalaqh(halaqh HalaqhData) async {
    List<Map<String, dynamic>> syllabusData =
        createSylaubscontroller.Syllabus.map(
                (element) => element.convetToMap() as Map<String, dynamic>)
            .toList();
    try {
      await firestore
          .collection('halaqh')
          .doc(HalaqhData.groupId)
          .set(HalaqhData.toMap());
      for (int i = 0; i < syllabusData.length; i++) {
        await firestore
            .collection('halaqh')
            .doc(HalaqhData.groupId)
            .collection('Syllabus')
            .add(syllabusData[i]);
      }
      return 'successfully';
    } catch (e) {
      Get.snackbar('Error sending halaqh or Syllabus data', e.toString());
    }
    createSylaubscontroller.Syllabus.clear();
    syllabusData.clear();
  }

  Future<void> addUserToGroup(String groupId, String userId) async {
    
    final groupRef =
        FirebaseFirestore.instance.collection('halaqh').doc(groupId);

    
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      
      final groupSnapshot = await transaction.get(groupRef);
      final groupData = groupSnapshot.data();
 
      if (groupData != null &&
          groupData['membersUid'] != null &&
          groupData['membersUid'].contains(userId)) {
         
        throw Exception(
            'User already belongs to the group'); 
      }

      
      if (groupData != null) {
        final updatedMembersUid = List<String>.from(groupData['membersUid']);
         
        updatedMembersUid.add(userId);
        transaction.update(groupRef, {'membersUid': updatedMembersUid});
      } else {
        print('error nullllll in addUserToGroup');
      }
       
    });
  }


 Future createHalaqhtest(halaqh HalaqhData,mockfirestore) async {
    List<Map<String, dynamic>> syllabusData =
        createSylaubscontroller.Syllabus.map(
                (element) => element.convetToMap() as Map<String, dynamic>)
            .toList();
    try {
      await mockfirestore
          .collection('halaqh')
          .doc(HalaqhData.groupId)
          .set(HalaqhData.toMap());
      for (int i = 0; i < syllabusData.length; i++) {
        await mockfirestore
            .collection('halaqh')
            .doc(HalaqhData.groupId)
            .collection('Syllabus')
            .add(syllabusData[i]);
      }
      return 'successfully';
    } catch (e) {
      Get.snackbar('Error sending halaqh or Syllabus data', e.toString());
    }
    createSylaubscontroller.Syllabus.clear();
    syllabusData.clear();
  }

}
