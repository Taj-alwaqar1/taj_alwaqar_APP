// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 


class HalaqhList extends StatelessWidget {
  String HalaqhName;
  HalaqhList({super.key, required this.HalaqhName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 70,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          child: ListTile(
            onTap: () {
              // Navigator.pushNamed(context, '/teacherDetail');
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    
                    Text(
                      "الحلقة:${HalaqhName}",
                      style: TextStyle(color: yallowTextColor, fontSize: 28),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
