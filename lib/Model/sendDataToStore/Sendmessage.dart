

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Login&signincontroller/SigninController.dart';
import '../../Controller/pagesController/messageController.dart';
import '../../Controller/sharedController/sideBarController.dart';
import '../AuthenticateAcc/AuthenticateAcc.dart';

class SendMessage extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;


  goChat(userid, userName) async {
    final sideBarController controllerSideBar = Get.put(sideBarController());
    final User? user = auth.currentUser;
    var from_message = await firestore
        .collection('message')
        .withConverter(
            fromFirestore: msg.fromFirestore,
            toFirestore: (msg Msg, options) => Msg.toFirestore())
        .where('from_uid', isEqualTo: user?.uid)
        .where('to_uid', isEqualTo: userid)
        .get();

    var to_message = await firestore
        .collection('message')
        .withConverter(
            fromFirestore: msg.fromFirestore,
            toFirestore: (msg Msg, options) => Msg.toFirestore())
        .where('from_uid', isEqualTo: userid)
        .where('to_uid', isEqualTo: user?.uid)
        .get();
    if (from_message.docs.isEmpty && to_message.docs.isEmpty) {
      var msgdata = msg(
          from_uid: user?.uid,
          to_uid: userid,
          from_name: controllerSideBar.username.value,
          to_name: userName,
          last_msg: "",
          last_time: Timestamp.now(),
          msg_num: 0);

      await firestore
          .collection('message')
          .withConverter(
              fromFirestore: msg.fromFirestore,
              toFirestore: (msg Msg, options) => Msg.toFirestore())
          .add(msgdata)
          .then((value) {
          Get.toNamed('/chat', parameters: {
          'doc_id': value.id,
          'to_uid': userid ?? "",
          'to_name': userName ?? ""
        });
      });
    } else {
      if (from_message.docs.isNotEmpty) {
        Get.toNamed('/chat', parameters: {
          'doc_id': from_message.docs.first.id,
          'to_uid': userid ?? "",
          'to_name': userName ?? ""
        });
      }
      if (to_message.docs.isNotEmpty) {
        Get.toNamed('/chat', parameters: {
          'doc_id': to_message.docs.first.id,
          'to_uid': userid ?? "",
          'to_name': userName ?? ""
        });
      }
    }
  }





  sendMsg(content,doc_id,textController,sendContent) async {
    await firestore
        .collection('message')
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: msgContent.fromFirestore,
            toFirestore: (msgContent msgContent, options) =>
                msgContent.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      print("doc add with id ${doc_id} ");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await firestore.collection('message').doc(doc_id).update({
      'last_msg': sendContent,
      'last_time': Timestamp.now(),
    });
  }


//for a group chatingg 
void saveMessageToMessageSubcollection({
  //this is group id = recieverUserId
    required String recieverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    // required MessageEnum messageType,
    // required MessageReply? messageReply,
    required String senderUsername,
    required String? recieverUserName,
    // required bool isGroupChat,
  }) async {
    final message = MessageGroup(
      senderId: auth.currentUser!.uid,
      recieverid: recieverUserId,
      text: text,

      timeSent: timeSent,
      messageId: messageId, 
    );
   
      await firestore
          .collection('halaqh')
          .doc(recieverUserId)
          .collection('chats')
          .doc(messageId)
          .set(
            message.toMap(),
          );
    // } 
     }
 
}
