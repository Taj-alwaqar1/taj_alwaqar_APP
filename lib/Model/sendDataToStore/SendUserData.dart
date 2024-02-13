import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class SendUserData extends GetxController {
  
   CollectionReference students = FirebaseFirestore.instance.collection('students');
  Future<void> addstudents(
  String username,
  String fristname,
  String lastname,
  String age,
  String phonenumber,
  String levelstd,
  String email,
  String password,
) async {
  try {
    // Call the user's CollectionReference to add a new user
    await students.add({
      "username": username,
      "fristname": fristname,
      "lastname": lastname,
      "age": age,
      "phonenumber": phonenumber,
      "levelstd": levelstd,
      "email": email,
      "password": password,
    });
    print("User Added");
  } catch (error) {
    print("Failed to add user: $error");
  }
}
}
