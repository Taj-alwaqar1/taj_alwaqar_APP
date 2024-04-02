// ignore_for_file: curly_braces_in_flow_control_structures, avoid_single_cascade_in_expression_statements, non_constant_identifier_names

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetHalaqhInfo extends GetxController {
  final HalaqhNames = RxList<String>([]).obs;

  final Halaqhids = RxList<String>([]).obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String halaqhName ;
  Future<RxList<String>> getHalaqhNames() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }

      await for (var halaqhsnapshot
          in _firestore.collection('halaqh').snapshots()) {
        final halaqhData = halaqhsnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        for (final halaqh in halaqhData) {
          if (halaqh['teacheruid'] != null) {
            final String halaqhName = halaqh['halqahName'];
            HalaqhNames.value.add(halaqhName); // Use add for reactive updates
          }
        }
      }
      return HalaqhNames.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }

  Future<RxList<String>> getHalaqhids() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }

      await for (var halaqhsnapshot
          in _firestore.collection('halaqh').snapshots()) {
        final halaqhData = halaqhsnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        for (final halaqh in halaqhData) {
          if (halaqh['teacheruid'] != null) {
            final String halaqhid = halaqh['groupId'];
            Halaqhids.value.add(halaqhid); // Use add for reactive updates
          }
        }
      }
      return Halaqhids.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }

  // Future<Map<String, dynamic>?> gethalaqhData(currenthalaqhId) async {
  //   final user = _auth.currentUser;

  //   if (user != null) {
  //     // final uid = user.uid;
  //     final docRef = _firestore.collection('halaqh').doc(currenthalaqhId);

  //     try {
  //       final snapshot = await docRef.get();
  //       if (snapshot.exists) {
  //         return snapshot.data() as Map<String, dynamic>;
  //       } else {
  //         print('No user data found for UID: $currenthalaqhId');
  //         return null;
  //       }
  //     } catch (e) {
  //       print('Error getting  halaqh: $e');
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  // Future<String?> getnameee(currenthalaqhId) async {
  //   final userData = await gethalaqhData(currenthalaqhId);
  //   try {
  //     if (userData != null && userData.containsKey('halqahName')) {
  //       return halaqhName.value = userData['halqahName'];
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error getting  halaqh nameeeeeee: $e');
  //     return null;
  //   }
  // }

  Future<String> ReturnHalaqhName(currenthalaqhId) async {
    final User? user = _auth.currentUser;

    if (user == null) {
      print('User is not authenticated.');
      return halaqhName ?? "kkkkk";
    }
    try {
      // Get a reference to the document in the 'halaqh' collection
      final docRef = _firestore.collection('halaqh').doc(currenthalaqhId);

      // Fetch the document data
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        String halaqhNameee = data?['halqahName'] as String;
        halaqhName = halaqhNameee;

        // Return the extracted string value
        return halaqhNameee;
      } else {
        print('User document does not exist for Halaqh name!');
        return '';
      }
    } catch (error) {
      print('Error fetching Halaqh name: ${error}');
      return '';
    }
  }
}
