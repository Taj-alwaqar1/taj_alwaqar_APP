// import 'dart:js_util';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// import '../AuthenticateAcc/AuthenticateAcc.dart';

// class SendMessage extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> SendMessagetoFireBase(
//       String email,
//       String text) async {
//     final user = _auth.currentUser;
//     final uid = user!.uid;
//     final docRef = _firestore.collection('messages');
//     try {
//       await add({
//         "email": email,
//         "text": text,
//       });
//       print('Message send successfully!');
//     } catch (e) {
//       print('Error send message: $e');
//     }
   
//   }
// }
