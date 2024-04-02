import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Controller/Login&signincontroller/SigninController.dart';
import '../../view/Login&&Signin/LogIn.dart';
import '../AuthenticateAcc/AuthenticateAcc.dart';

class SendStdData extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(
      String username,
      String firstname,
      String lastname,
      String age,
      String phonenumber,
      String levelstd,
      String email,
      String password,
      String groupUid
      ) async {
    final user = _auth.currentUser;
    final uid = user!.uid;
    final docRef = _firestore.collection('users').doc(uid);
  userInfo userAccounet=
    userInfo(
        uid:uid,
        username: username,
        firstname: firstname,
        lastname: lastname,
        age: age,
        phonenumber: phonenumber,
        levelstd: levelstd,
        email: email,
        password: password,
        groupUid:groupUid
        );
    try {
      await docRef.set(userAccounet.convetToMap());
      print('User added successfully!');
      Get.off(() => Login());
    } catch (e) {
      print('Error adding user: $e');
    }
  }
  
  
  Future<void> addGroupUidToFirestore(String userId, String groupUid) async {
  // Get a reference to the specific document
  final docRef = FirebaseFirestore.instance.collection('users').doc(userId);

  // Update the document, adding or setting the 'groupUid' field
  await docRef.update({
    'groupUid': groupUid,
  });

  print('groupUid added to document successfully!');
}
}
