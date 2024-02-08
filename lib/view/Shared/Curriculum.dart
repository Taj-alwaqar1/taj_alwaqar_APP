// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 
class Curriculum extends StatelessWidget {
  String halaqhDays, nameOfSurah;
  int startVerse, endVerse;
  Curriculum({super.key, required this.halaqhDays, required this.nameOfSurah,required this.startVerse,required this.endVerse});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(15),
        color: goldenColor,
      ),
      height: 175,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            halaqhDays,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Text(
            "سورة: ${nameOfSurah}",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Text(
            "من ${startVerse} الى ${endVerse}",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
