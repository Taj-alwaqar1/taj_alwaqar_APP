// ignore_for_file: curly_braces_in_flow_control_structures, avoid_single_cascade_in_expression_statements

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetTeacherData extends GetxController {
  final teachersName = RxList<String>([]).obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}
