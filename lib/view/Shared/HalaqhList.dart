// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/search.dart';
import 'package:get/get.dart';
import '../Pages/Halaqh.dart';
import '../Shared/appBar.dart';
import '../Shared/color.dart';

import '../Shared/SideBar.dart';

class HalaqhList extends StatefulWidget {
  const HalaqhList({super.key});

  @override
  State<HalaqhList> createState() => _halaqh_TeacState();
}

class _halaqh_TeacState extends State<HalaqhList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CustomAppBar("الحلقات"),
          centerTitle: true,
          backgroundColor: darkGreen,
        ),
        body: ListView.builder(
          // itemCount: controller.teachersNames.length,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        height: 70,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/teacherDetail'); // hhh
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Text(
                                    //   // "المعلم: ${controller.teachersNames[index]}",//variable
                                    //   // style: TextStyle(
                                    //   //     color: yallowTextColor, fontSize: 28),
                                    // ),
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
                        )),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: botoom(),
      ),
    );
  }
}
