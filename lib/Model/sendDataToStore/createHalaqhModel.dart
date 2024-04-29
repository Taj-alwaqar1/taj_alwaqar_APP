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
// print(syllabusData.length);
    try {
      await firestore
          .collection('halaqh')
          .doc(HalaqhData.groupId)
          .set(HalaqhData.toMap());
      for (int i =0 ;i<syllabusData.length;i++) {
        await firestore
            .collection('halaqh')
            .doc(HalaqhData.groupId)
            .collection('Syllabus')
            .add(syllabusData[i]);
    }
  } catch (e) {
    Get.snackbar('Error sending halaqh or Syllabus data', e.toString());
  } 
    createSylaubscontroller.Syllabus.clear();
  syllabusData.clear();
}

Future<void> addUserToGroup(String groupId, String userId) async {
  // 1. Reference the group document in Firestore
  final groupRef = FirebaseFirestore.instance.collection('halaqh').doc(groupId);

  // 2. Perform a transaction to ensure data consistency
  await FirebaseFirestore.instance.runTransaction((transaction) async {
    // 2.1 Get the current group data
    final groupSnapshot = await transaction.get(groupRef);
    final groupData = groupSnapshot.data();

    // 2.2 Check if the user is already a member (optional)
   if (groupData != null && groupData['membersUid'] != null && groupData['membersUid'].contains(userId)) {
  // User already belongs to the group
  throw Exception('User already belongs to the group'); // Or handle it differently
}

    // 2.3 Update the membersUid list
   if (groupData != null) {
  final updatedMembersUid = List<String>.from(groupData['membersUid']);
 // Create a copy
    updatedMembersUid.add(userId);
     transaction.update(groupRef, {'membersUid': updatedMembersUid});
   }else{
    print('error nullllll in addUserToGroup');
   }
    // 2.4 Update the group document with the new membersUid list
   
  });
}
 
 
 
 
}
