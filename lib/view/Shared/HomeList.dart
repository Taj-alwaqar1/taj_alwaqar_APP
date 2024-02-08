// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 


class TeachersList extends StatelessWidget {
  String teacherName;
  TeachersList({super.key, required this.teacherName});

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
              Navigator.pushNamed(context, '/teacherDetail');
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: greenColor,
                        border: Border.all(color: goldenColor, width: 2),
                      ),
                      child: Icon(
                        Icons.person,
                        color: goldenColor,
                        size: 33,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "المعلم:${teacherName}",
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
