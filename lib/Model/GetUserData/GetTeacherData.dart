// ignore_for_file: curly_braces_in_flow_control_structures, avoid_single_cascade_in_expression_statements

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetTeacherData extends GetxController {
  final teachersName = RxList<String>([]).obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 final RxBool userType =true.obs;

  Future<RxList<String>> getTeacherNames() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }

      await for (var teachersSnapshot
          in _firestore.collection('users').snapshots()) {
        final teachersData = teachersSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        for (final userData in teachersData) {
          if (userData['levelstd'] == "" &&
              !doesContain(teachersName, userData['firstname'])) {
            final String teacherName = userData['firstname'];
            teachersName.value.add(teacherName); // Use add for reactive updates
          }
        }
      }
      return teachersName.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }

  bool doesContain(Rx<RxList<String>> list, String element) {
    for (final item in list.value) {
      if (item == element) {
        return true;
      }
    }
    return false;
  }

  Future getUserType() async {
    try {
      // Fetch the Firestore document
 final docRef = FirebaseFirestore.instance.collection('users').doc(_auth.currentUser?.uid);
  final docSnapshot = await docRef.get();

  // Check if the 'stdlevel' field exists and has a value
  if (docSnapshot.exists) {
    if (docSnapshot.data()!['levelstd']=='') {
      userType.value=false;
    }
    return userType.value;
  } else {
    return userType.value=true;
  }
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }
}
