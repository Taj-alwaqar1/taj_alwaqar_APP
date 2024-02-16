import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../AuthenticateAcc/AuthenticateAcc.dart';

class SendStdData extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(
      String username,
      String fristname,
      String lastname,
      String age,
      String phonenumber,
      String levelstd,
      String email,
      String password) async {
    final user = _auth.currentUser;
    final uid = user!.uid;
    final docRef = _firestore.collection('users').doc(uid);
    try {
      await docRef.set({
        "username": username,
        "fristname": fristname,
        "lastname": lastname,
        "age": age,
        "phonenumber": phonenumber,
        "levelstd": levelstd,
        "email": email,
        "password": password,
      });
      print('User added successfully!');
    } catch (e) {
      print('Error adding user: $e');
    }
   
  }
}
