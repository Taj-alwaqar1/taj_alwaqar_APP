// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/SigninController.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/messageController.dart';
import 'package:get/get.dart';

import '../../Controller/sharedController/sideBarController.dart';

class GetMessageInfo extends GetxController {
  final userName = RxList<String>([]).obs;
  final userid = RxList<String>([]).obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance; 

  

  Future<RxList<String>> getUserNames() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }
      await for (var userSnapshot
          in firestore.collection('users').snapshots()) {
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

  Future<RxList<String>> getUserid() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;

      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }
      await for (var userSnapshot
          in firestore.collection('users').snapshots()) {
        final UserData = userSnapshot.docs
            .where((doc) => doc.data()['uid'] != user?.uid)
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        for (final UserInfo in UserData) {
          {
            final String id = UserInfo['uid'];
            userid.value.add(id); // Use add for reactive updates
          }
        }
      }
      return userid.value;
    } catch (e) {
      print('Error occurred: $e');
      return RxList<String>([]);
    }
  }
 
 
 
 
  Stream<List<MessageGroup>> getGroupChatStream(String groudId) {
    return firestore
        .collection('halaqh')
        .doc(groudId)
        .collection('chats')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<MessageGroup> messages = [];
      for (var document in event.docs) {
        messages.add(MessageGroup.fromMap(document.data()));
      }
      print('okkkk');
      return messages;
    });
    
  }
 


}
