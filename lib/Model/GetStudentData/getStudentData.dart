// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class getStudentsData {
  final List<QueryDocumentSnapshot> StdData = [];
  GetStdData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("students").get();
      StdData.addAll(querySnapshot.docs);    
    } catch (error) {
      // Handle error
      print("Error fetching data: $error");
    }
  }

  String get GetStdName =>  StdData.isNotEmpty ? StdData[0]['username'] : "xxxxx" ;

  //  @override
  // void onInit() {z
  //   super.onInit();
  //   getStdData();
  // }
}
