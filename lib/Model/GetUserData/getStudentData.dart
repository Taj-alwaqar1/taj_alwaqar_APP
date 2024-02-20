import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetData {
  final List<Map<String, dynamic>> studentsData = [];
    final RxString username = ''.obs; 

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   
  Future<Map<String, dynamic>?> getStudentsData() async {
    final user = _auth.currentUser;

    if (user != null) {
      final uid = user.uid;
      final docRef = _firestore.collection('users').doc(uid);

      try {
        final snapshot = await docRef.get();
        if (snapshot.exists) {
          return snapshot.data() as Map<String, dynamic>;
        } else {
          print('No user data found for UID: $uid');
          return null;
        }
      } catch (e) {
        print('Error getting user data: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String?> getUsername() async {
    final userData = await getStudentsData();
    if (userData != null && userData.containsKey('username')) {
      return username.value= userData['username'];
    } else {
      return null;
    }
  }
  Future<String?> GetUserEmail() async {
    final userData = await getStudentsData();
    if (userData != null && userData.containsKey('username')) {
      return username.value= userData['username'];
    } else {
      return null;
    }
  }
}
