import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetData extends GetxController {
  final List<Map<String, dynamic>> studentsData = [];
  final RxString username = ''.obs;
  RxString groupUid = ''.obs;
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
      return username.value = userData['username'];
    } else {
      return null;
    }
  }

  Future<String?> GetUserEmail() async {
    final userData = await getStudentsData();
    if (userData != null && userData.containsKey('username')) {
      return username.value = userData['username'];
    } else {
      return null;
    }
  }
  
  Future<void> checkAndReturnGroupUid() async {
    final userId = _auth.currentUser!.uid;

    try {
      // Get a reference to the user document
      final docRef = FirebaseFirestore.instance.collection('users').doc(userId);

      // Fetch the document data
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        groupUid.value = data?['groupUid'];

        if (groupUid.value != null) {
          print('groupUid is not null: ${groupUid.value} ');
          // Use the groupUid value for further actions
        } else {
          print('groupUid is null');
          // Handle the case where groupUid is null
        }
      } else {
        print('User document does not exist!');
        // Handle the case where the user document doesn't exist
      }
    } catch (error) {
      print('Error fetching groupUid: $error');
      // Handle any errors that occur during the fetch
    }
  }
}
