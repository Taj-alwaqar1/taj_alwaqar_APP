import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SendStdData extends GetxController {
    final user = FirebaseAuth.instance.currentUser;

  Future<void> addStudents(
      String username,
      String fristname,
      String lastname,
      String age,
      String phonenumber,
      String levelstd,
      String email,
      String password) async {
    try {
      // Assuming you have the user ID (adapt based on your logic)
       // Get the authenticated user's ID
final docID = user!.uid;
      // Create a new document with user ID as the ID
      final docRef = FirebaseFirestore.instance.collection('students').doc(docID);

      // Add data to the document
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

      print("User Added");
    } catch (error) {
      print("Failed to add user: $error");
      // Handle errors appropriately
    }
  }

  // ... other methods if needed
}
