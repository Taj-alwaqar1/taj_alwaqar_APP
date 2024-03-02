import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetMessageInfo{
 final userName = RxList<String>([]).obs;
 final userEmail = RxList<String>([]).obs;
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RxList<String>> getUserNames() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }
      await for (var userSnapshot
          in _firestore.collection('users').snapshots()) {
        final UserData = userSnapshot.docs
            .where((doc) => doc.data()['uid'] != user.uid)
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        for (final userData in UserData) {
           {
            final String UserName = userData['username'];
            userName.value.add(UserName); // Use add for reactive updates
  
          }
        }
      }
      return userName.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }


  Future<RxList<String>> getUseremail() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }
      await for (var userSnapshot
          in _firestore.collection('users').snapshots()) {
        final UserData = userSnapshot.docs
        .where((doc) => doc.data()['uid'] != user.uid)
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        for (final UserInfo in UserData) {
           {
            final String Email = UserInfo['email'];
            userEmail.value.add(Email); // Use add for reactive updates
  
          }
        }
      }
      return userEmail.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }



}
