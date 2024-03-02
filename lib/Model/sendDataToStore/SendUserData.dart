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
      String password) async {
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
        password: password);
    try {
      await docRef.set(userAccounet.convetToMap());
      print('User added successfully!');
      Get.off(() => Login());
    } catch (e) {
      print('Error adding user: $e');
    }
  }
}
