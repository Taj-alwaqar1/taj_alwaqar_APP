// ignore_for_file: curly_braces_in_flow_control_structures, avoid_single_cascade_in_expression_statements, non_constant_identifier_names

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/createHalaqhController.dart';
import 'package:get/get.dart';

class GetHalaqhInfo extends GetxController {
  final HalaqhNames = RxList<String>([]).obs;
  final Halaqhids = RxList<String>([]).obs;
  final TeacherNames = RxList<String>([]).obs;
  final OwnHalaqh = RxList<String>([]).obs;
  final OwnHalaqhids = RxList<String>([]).obs;
  final halaqhDays = RxList<String>([]).obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String halaqhName;
  RxString mosqueName=''.obs;

  var last = null;

  final memberIDs = RxList<String>().obs;
  final memberNames = RxList<String>().obs;

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

  Future<RxList<String>> getTeacherNames() async {
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
            final String TeacherName = halaqh['teacherName'];
            TeacherNames.value.add(TeacherName); // Use add for reactive updates
          }
        }
      }
      return TeacherNames.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }

  Future<RxList<String>> gethalaqhDays() async {
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
            final String halaqhDay = halaqh['halaqhDays'];
            halaqhDays.value.add(halaqhDay); // Use add for reactive updates
          }
        }
      }
      return halaqhDays.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }

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

//getOwnHalaqhNames and ids
  Future<RxList<String>> getOwnHalaqhNames() async {
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
          if (halaqh['teacheruid'] == user.uid) {
            final String ownHalaqh = halaqh['halqahName'];
            OwnHalaqh.value.add(ownHalaqh); // Use add for reactive updates
          }
        }
        for (final halaqh in halaqhData) {
          if (halaqh['teacheruid'] == user.uid) {
            final String id = halaqh['groupId'];
            OwnHalaqhids.value.add(id); // Use add for reactive updates
          }
        }
      }
      return OwnHalaqh.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }

  Future<List<String>> getMemberIDs(String docID) async {
    final docRef = FirebaseFirestore.instance.collection('halaqh').doc(docID);
    final docSnapshot = await docRef.get();
    
    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      if (data != null && data.containsKey('membersUid')) {
        memberIDs.value
            .addAll((data['membersUid'] as List<dynamic>).cast<String>());
      }
    }

    return RxList<String>([]);
  }

  Future<List<String>> getMemberNames(List<String> memberIDs) async {
    final collectionRef = FirebaseFirestore.instance.collection('users');

    for (final id in memberIDs) {
      try {
        final docSnapshot = await collectionRef.doc(id).get();

        if (docSnapshot.exists) {
          final data = docSnapshot.data();
          if (data != null && data.containsKey('firstname')) {
            memberNames.value.add(data['firstname'] as String);
          }
        }
      } catch (e) {
        print('Error retrieving member name for ID $id: $e');
      }
    }

    return RxList<String>([]);
  }

Future<List<Map<String, dynamic>>> getAllSyllabus(String groupId) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('halaqh')
        .doc(groupId)
        .collection('Syllabus')
        .get();

    final List<Map<String, dynamic>> syllabusList = snapshot.docs.map((doc) => doc.data()).toList();
    return syllabusList;
  } catch (e) {
    print('Error retrieving syllabus: $e');
    return [];
  }
}

  Future<String> ReturnMosqueName(currenthalaqhId) async {
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
        mosqueName.value = data?['mosqueName'] as String;
        
        // Return the extracted string value
        return  mosqueName.value;
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
