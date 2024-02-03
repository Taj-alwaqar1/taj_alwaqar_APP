// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/appBar.dart';
import 'package:frist_file_taj_alwaqar/Shared/color.dart';

import '../Shared/HalaqhList.dart';
import '../Shared/SideBar.dart';

class halaqh extends StatelessWidget {
  const halaqh({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
       decoration: BoxDecoration(
        gradient: GradientGreen,),
       child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CustomAppBar("الحلقات"),
          backgroundColor: darkGreen,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.account_circle_rounded,
                  size: 40, color:goldenColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: SideBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
            HalaqhList(HalaqhName: ' عثمان بن عفان',),
          ]),
        ),
           ),
     );
  }
}