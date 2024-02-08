// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/HomeList.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';

 

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(child: CustomAppBar("المعلمين")),
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
          actions: [
            IconButton(onPressed: 
            (){
            Navigator.pushNamed(context,'/search');
            }, icon: Icon(Icons.search,color: goldenColor,size: 40,))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TeachersList(teacherName: ' عدي',),
                TeachersList(teacherName: ' اسامه الغامدي',),
                TeachersList(teacherName: ' انس',),
                TeachersList(teacherName: ' علي',),
                TeachersList(teacherName: ' يوسف',),
                TeachersList(teacherName: ' حمد',),
                TeachersList(teacherName: ' يونس',),
                TeachersList(teacherName: ' خالد',),
                TeachersList(teacherName: ' عبدالرحمن',),
              ],
            ),
          ),
        ),
        drawer: SideBar(),
      ),
    );
  }
}
