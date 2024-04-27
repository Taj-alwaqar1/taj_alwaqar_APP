 //ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/pagesController/callController.dart';

class getCallData extends GetxController {
  final currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot> get callStream =>
      firestore.collection('call').doc(currentUser!.uid).snapshots();

// Stream<Map<String, dynamic>?> getAllCallsStream() {
//   if (currentUser != null) {
//     final uid = currentUser?.uid;
//     final docRef = firestore.collection('call').doc(uid);
//     return docRef.snapshots().map((snapshot) {
//       if (snapshot.exists) {  
//         return snapshot.data() as Map<String, dynamic>;
//       } else {
//         print('No call data found for UID: $uid');
//         return null;
//       }
//     }).handleError((error) {
//       print('Error getting user data: $error');
//       return null; });
//   } else { 
//     return Stream.empty();
//   }
// }

Future<String?> getCallIdFromFirestore(String receiveruid) async {
  try {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return null; // Handle null user

    final myId = currentUser.uid;

    // Create queries for both directions (caller/receiver)
    final query1 = FirebaseFirestore.instance
      .collection('call')
      .where('callerId', isEqualTo: myId)
      .where('receiverId', isEqualTo: receiveruid);

    final query2 = FirebaseFirestore.instance
      .collection('call')
      .where('callerId', isEqualTo: receiveruid)
      .where('receiverId', isEqualTo: myId);

    // Combine results from both queries
    final combinedSnapshot = await Future.wait([query1.get(), query2.get()]);

    for (var docSnap in combinedSnapshot) {
      if (docSnap.docs.isNotEmpty) {
        final data = docSnap.docs.first.data();
        if (data != null && data['callId'] != null) {
          return data['callId']; // Return the first found callId
        }
      }
    }

    // No matching call found in either direction
    return null;
  } catch (e) {
    print('Error getting callId from Firestore: $e');
    return null;
  }
}


// Future<String?> getCallIdFromFirestore(String receiveruid) async {
//   try {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) return null; // Handle null user

//     final docRef = FirebaseFirestore.instance
//       .collection('call')
//       .where('callerId', isEqualTo: currentUser.uid)
//       .where('receiverId', isEqualTo: receiveruid);

//     final docSnap = await docRef.get();
//     if (docSnap.docs.isNotEmpty) {
//       final data = docSnap.docs.first.data();
//       if (data != null && data['callId'] != null) {
//         print('xxxxxxxxxxxxxxxx${data['callId']}');
//         return data['callId']; // Return existing callId
//       }
//     }
    
//   } catch (e) {
//     print('Error getting callId from Firestore: $e');
//     return null;
//   }
// }


//  Future<String?> getCallIdFromFirestore(String receiveruid,) async {
//    try {
//      final docRef = FirebaseFirestore.instance
//          .collection('call')
//          .where('callerId', isEqualTo: currentUser!.uid )
//          .where('receiverId', isEqualTo: receiveruid)
         
//          ;
//      final docSnap = await docRef.get();
//      if (docSnap.docs.isNotEmpty) {
       
//        final data = docSnap.docs.first.data();
//        if (data != null && data['callId'] != null) {
//         print(data['callId']);
//          return data['callId'];
//        } else {
//          print('Document exists but callId is missing or null for user: $currentUser!.uid');
//          return null;  
//        }
//      } else {
       
//        print('No matching call document found for user and receiver');
//        return null;  
//      }
//    } catch (e) {
//      print('Error getting callId from Firestore: $e');
//      return null; 
//    }
//  }
//   Future<String?> getcalleridFromFire(String receiverid) async {
//     final uid = currentUser?.uid;
//     final callStream = getAllCallsStream() ;
//     try {
//     final callData = await callStream.firstWhere((data) => 
//     (data?['callerId'] == uid && data?['receiverId'] == receiverid) ||
// (data?['receiverId'] == uid && data?['callerId'] == receiverid));
//     if (callData != null) { 
//       return callData['callId'] ;
//     } else {
//       return null;  
//     }
//   } catch (e) {
//     print('Error getting call data: $e');
//     return null; }
//   }
}
