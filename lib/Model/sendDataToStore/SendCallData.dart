// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/pagesController/callController.dart';

class callRepository extends GetxController{
 
  makeCall(firestore,Call senderCallData, Call receiverCallData ) async {
   
    try {
      await firestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toMap());
      await firestore
          .collection('call')
          .doc(senderCallData.receiverId)
          .set(receiverCallData.toMap());
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }
}
