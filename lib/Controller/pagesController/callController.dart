// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/Model/sendDataToStore/SendCallData.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../Model/GetUserData/getCalls.dart';
import '../../Model/GetUserData/getMessage.dart';
// import 'package:xid/xid.dart'; 

import '../sharedController/sideBarController.dart';

class CallController extends GetxController {
  final currentUser_id = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GetUsername = Get.put(GetMessageInfo());
  final CallRepository = Get.put(callRepository());
  final GetCallData = Get.put(getCallData());
  final calleridFromFire = ''.obs;

  final SideBarcontroller = Get.put(sideBarController());

  RxString receiveruid = "".obs;
  RxString receiverName = "".obs;
  RxBool isGroupChat = false.obs;
  RxString CallId = ''.obs;

  RxString channelId = ''.obs;
  late final Call call;

  
  getvalue(getUserid, getUserName) async {
    receiveruid.value = getUserid;
    receiverName.value = getUserName;
  }

  ZegoSendCallInvitationButton actionButton() => ZegoSendCallInvitationButton(
        isVideoCall: true,
        resourceID: "zegouikit_call",
        invitees: [
          ZegoUIKitUser(
            id: receiverName.value,
            name: receiverName.value,
          ),
        ],
      );

  Stream<DocumentSnapshot> get callStream => GetCallData.callStream;

checkValue() async {
  calleridFromFire.value = await GetCallData.getCallIdFromFirestore(receiveruid.value) ?? '';

  if (calleridFromFire.value == '' || calleridFromFire.value == null || calleridFromFire.value.isEmpty) {
    print('No caller ID found in Firestore');
    CallId.value = DateTime.now().millisecondsSinceEpoch.toString() + '_' + randomString(8);
  } else {
    CallId.value = calleridFromFire.value;
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

  makeCall() async {
    Call senderCallData = Call(
        callerId: currentUser_id,
        callerName: SideBarcontroller.username.value,
        receiverId: receiveruid.value,
        receiverName: receiverName.value,
        callId: CallId.value,
        hasDialled: false);

    Call receiverCallData = Call(
        callerId: currentUser_id,
        callerName: SideBarcontroller.username.value,
        receiverId: receiveruid.value,
        receiverName: receiverName.value,
        callId: CallId.value,
        hasDialled: false);

    await CallRepository.makeCall(firestore, senderCallData, receiverCallData);
  }

  getInfoFromCall(id, callinfo, isGroupChatorNot) {
    channelId.value = id;
    call = callinfo;
    isGroupChat = isGroupChatorNot;
  }
}

class Call {
  final String callerId;
  final String callerName;
  final String receiverId;
  final String receiverName;
  final String callId;
  final bool hasDialled;

  Call({
    required this.callerId,
    required this.callerName,
    required this.receiverId,
    required this.receiverName,
    required this.callId,
    required this.hasDialled,
  });
  Map<String, dynamic> toMap() {
    return {
      'callerId': callerId,
      'callerName': callerName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'callId': callId,
      'hasDialled': hasDialled,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      callerId: map['callerId'] ?? '',
      callerName: map['callerName'] ?? '',
      receiverId: map['receiverId'] ?? '',
      receiverName: map['receiverName'] ?? '',
      callId: map['callId'] ?? '',
      hasDialled: map['hasDialled'] ?? false,
    );
  }
}
