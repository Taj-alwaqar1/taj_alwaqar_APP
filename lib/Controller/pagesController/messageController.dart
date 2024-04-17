// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/callController.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendCallData.dart';
import '../../Model/GetUserData/getMessage.dart';
import '../../Model/sendDataToStore/Sendmessage.dart';
import '../../view/Pages/chatscreen.dart';
import '../Login&signincontroller/SigninController.dart';

class MessageController extends GetxController {
  RxString Name = "".obs;
  //for the another user like touid not me the user in the another siade
  RxString userid = "".obs;

  var to_uid = ''.obs;
  var to_name = ''.obs;

  RxList msgcontentList = [].obs;

  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentnode = FocusNode();

  final currentUser_id = FirebaseAuth.instance.currentUser?.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GetUsername = Get.put(GetMessageInfo());
  final sendmessage = Get.put(SendMessage());
  final CallController = Get.put(callRepository());

  final GetData getStudentsDataModel = Get.put(GetData());

  RxString get username => getStudentsDataModel.username;

  final textControllerGroup = TextEditingController();
  FocusNode contentnodeGroup = FocusNode();

  var listener;

  RxList<String> get userName => GetUsername.userName.value;

  RxList<String> get useridMethode => GetUsername.userid.value;

  @override
  void onInit() async {
    super.onInit();
    await callermethode();
  }

  callermethode() async {
    GetUsername.getUserNames();
    GetUsername.getUserid();
  }

  sendmsg() async {
    String sendContent = textController.text;
    final content = msgContent(
      uid: currentUser_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now(),
    );

    await sendmessage.sendMsg(content, doc_id, textController, sendContent);
  }

  void navigateToChatScreen(String Username, String id) async {
    Name.value = Username;
    userid.value = id;
    //hereeeeeeee
    await sendmessage.goChat(userid.value, Name.value);
    final data = Get.parameters;
    doc_id = data['doc_id'];
    // CallController
    print(doc_id);
    to_uid.value = data['to_uid'] ?? "";
    // CallController
    print(to_uid.value);
    to_name.value = data['to_name'] ?? "";
    // CallController
    print(to_name.value);

    displayMsg();
  }

//here get message
  displayMsg() {
    var messages = firestore
        .collection('message')
        .doc(doc_id)
        .collection('msglist')
        .withConverter(
            fromFirestore: msgContent.fromFirestore,
            toFirestore: (msgContent MsgContent, options) =>
                MsgContent.toFirestore())
        .orderBy("addtime", descending: true);
    msgcontentList.clear();
    listener = messages.snapshots().listen((event) async {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              msgcontentList.insert(0, change.doc.data());
            } else {
              print('Document data not found');
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    }, onError: (Error) => print('error listener ${Error}'));
    print('doneee');
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.dispose();
    super.dispose();
  }

  Stream<List<MessageGroup>> groupChatStream(String groupId) {
    // print(groupId+'=============');
    return GetUsername.getGroupChatStream(groupId);
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    // required userInfo senderUser,
    // required bool isGroupChat,
  }) async {
    try {
       DateTime timeSent = DateTime.now();
      userInfo? recieverUserData;

      // if (!isGroupChat) {
      //   var userDataMap =
      //       await firestore.collection('users').doc(recieverUserId).get();
      //   recieverUserData = UserModel.fromMap(userDataMap.data()!);
      // }

      var messageId = DateTime.now().millisecondsSinceEpoch.toString() +
          '_' +
          randomString(8);

      // _saveDataToContactsSubcollection(
      //   senderUser,
      //   recieverUserData,
      //   text,
      //   timeSent,
      //   recieverUserId,
      //   isGroupChat,
      // );

      sendmessage.saveMessageToMessageSubcollection(
        recieverUserId: recieverUserId,
        text: text,
        timeSent: timeSent,
        // messageType: MessageEnum.text,
        messageId: messageId,
        username: username.value,
        // messageReply: messageReply,
        recieverUserName: recieverUserData?.username,
        senderUsername: username.value,
        // isGroupChat: isGroupChat,
      );
      
    } catch (e) {
      Get.snackbar('error in sendTextMessage', e.toString());
    }
  }

  String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    final stringBuffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      stringBuffer.write(chars[random.nextInt(chars.length)]);
    }
    return stringBuffer.toString();
  }
}

class msg {
  String? from_uid;
  String? to_uid;
  String? from_name;
  String? to_name;
  String? last_msg;
  Timestamp? last_time;

  int? msg_num;
  msg({
    required this.from_uid,
    required this.to_uid,
    required this.from_name,
    required this.to_name,
    required this.last_msg,
    required this.last_time,
    required this.msg_num,
  });

  factory msg.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return msg(
      from_uid: data?['from_uid'],
      to_uid: data?['to_uid'],
      from_name: data?['from_name'],
      to_name: data?['to_name'],
      last_msg: data?['last_msg'],
      last_time: data?['last_time'],
      msg_num: data?['msg_num'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (from_uid != null) 'from_uid': from_uid,
      if (to_uid != null) 'to_uid': to_uid,
      if (from_name != null) 'from_name': from_name,
      if (to_name != null) 'to_name': to_name,
      if (last_msg != null) 'last_msg': last_msg,
      if (last_time != null) 'last_time': last_time,
      if (msg_num != null) 'msg_num': msg_num,
    };
  }
}

class msgContent {
  final String? uid;
  final String? content;
  final String? type;
  final Timestamp? addtime;
  msgContent({
    this.uid,
    this.content,
    this.type,
    this.addtime,
  });

  factory msgContent.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return msgContent(
      uid: data?['uid'],
      content: data?['content'],
      type: data?['type'],
      addtime: data?['addtime'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'content': content,
      'type': type,
      'addtime': addtime,
    };
  }
}

class MessageGroup {
  final String senderId;
  final String recieverid;
  final String text;
  final DateTime timeSent;
  final String messageId;
  // final bool isSeen;
  // final String repliedMessage;
  // final String repliedTo;

  MessageGroup({
    required this.senderId,
    required this.recieverid,
    required this.text,
    required this.timeSent,
    required this.messageId,
    // required this.isSeen,
    // required this.repliedMessage,
    // required this.repliedTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'recieverid': recieverid,
      'text': text,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'messageId': messageId,
      // 'isSeen': isSeen,
      // 'repliedMessage': repliedMessage,
      // 'repliedTo': repliedTo,
    };
  }

  factory MessageGroup.fromMap(Map<String, dynamic> map) {
    return MessageGroup(
      senderId: map['senderId'] ?? '',
      recieverid: map['recieverid'] ?? '',
      text: map['text'] ?? '',
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      messageId: map['messageId'] ?? '',
      // isSeen: map['isSeen'] ?? false,
      // repliedMessage: map['repliedMessage'] ?? '',
      // repliedTo: map['repliedTo'] ?? '',
    );
  }
}
