// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/botoomNavController.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/AI.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Chat.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Home_Std.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Home_Tec.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Quran.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Curriculum.dart';
import 'package:get/get.dart';

import '../../Controller/pagesController/TeacherDetailController.dart';
import '../../Controller/sharedController/TabBarController.dart';

class TeacherDetail extends StatelessWidget {
  const TeacherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavnController controllernav = Get.put(bottomNavnController());
    final TabBarController controllerTabBar = Get.put(TabBarController());
    final ControllerTecher = Get.put(TeacherController());

    return Container(
      decoration: BoxDecoration(gradient: GradientGreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: botoom(),
        appBar: AppBar(
          title: Text("المعلم : ${ControllerTecher.Name}",
              style: TextStyle(color: yallowTextColor, fontSize: 29)),
          backgroundColor: darkGreen,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              height: 175,
              width: 330,
              decoration: BoxDecoration(
                gradient: GradientGreen,
                borderRadius: BorderRadius.circular(15),
                shape: BoxShape.rectangle,
                border: Border.all(width: 3),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      backgroundImage: AssetImage("assets/img/avatar.png"),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 10,
                      child: Column(
                        children: [
                          Text("الاسم:  ${ControllerTecher.Name.value}",
                              style: TextStyle(
                                  color: yallowTextColor, fontSize: 19)),
                          Text("التقييم:4.6",
                              style: TextStyle(
                                  color: yallowTextColor, fontSize: 19)),
                        ],
                      )),
                  Positioned(
                      left: 5,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.message_sharp, color: goldenColor),
                      )),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    DisplayHalaqhCurriculm(context);
                  },
                  child: Row(
                    children: [
                      CardMenu(
                        levelOfStudent: ' مبتدئ',
                        nameOfHalaqh: 'عثمان بن عفان',
                        numberOfStudent: 23,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CardMenu(
                        levelOfStudent: ' متوسط',
                        nameOfHalaqh: 'عمر بن الخطاب',
                        numberOfStudent: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CardMenu(
                        levelOfStudent: 'متوسط ',
                        nameOfHalaqh: 'عمر بن الخطاب',
                        numberOfStudent: 29,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CardMenu(
                        levelOfStudent: ' متوسط',
                        nameOfHalaqh: 'عمر بن الخطاب',
                        numberOfStudent: 17,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 50),
              child: Text(
                "المراجعات",
                style: TextStyle(color: yallowTextColor, fontSize: 27),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(18),
                      height: 470,
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                              28.0,
                            ),
                            child: TextField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "قيمني",
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.stars),
                              Icon(Icons.stars),
                              Icon(Icons.stars),
                              Icon(Icons.stars),
                              Icon(Icons.stars),
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Container(
                            height: 60,
                            width: 230,
                            decoration: BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "ارسال",
                                style: TextStyle(
                                    color: yallowTextColor, fontSize: 20),
                              ),
                              //row stars
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  isScrollControlled: true,
                );
              },
              child: Container(
                padding: EdgeInsets.only(top: 10),
                height: 126,
                margin: EdgeInsets.fromLTRB(50, 0, 50, 40),
                decoration: BoxDecoration(
                  gradient: GradientGreen,
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.4),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 50,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 22,
                          backgroundImage: AssetImage("assets/img/avatar.png")),
                    ),
                    Positioned(
                        bottom: 50,
                        left: 60,
                        child: Text(" اسامه ***",
                            style: TextStyle(
                                color: yallowTextColor, fontSize: 19))),
                    Positioned(
                        bottom: 80,
                        right: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.stars,
                              color: goldenColor,
                              size: 20,
                            ),
                            Icon(
                              Icons.stars,
                              size: 20,
                              color: goldenColor,
                            ),
                            Icon(
                              Icons.stars,
                              size: 20,
                              color: goldenColor,
                            ),
                            Icon(
                              Icons.stars,
                              size: 20,
                              color: goldenColor,
                            ),
                            Icon(
                              Icons.stars,
                              size: 20,
                              color: goldenColor,
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 80,
                        right: 10,
                        child: Text(" 2",
                            style: TextStyle(
                                color: yallowTextColor, fontSize: 19))),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  String nameOfHalaqh, levelOfStudent;
  int numberOfStudent;
  CardMenu(
      {super.key,
      required this.levelOfStudent,
      required this.nameOfHalaqh,
      required this.numberOfStudent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: goldenColor,
          ),
          height: 214,
          width: 149,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " حلقة ${nameOfHalaqh}",
                style: TextStyle(color: yallowTextColor, fontSize: 18),
              ),
              Text("مستوى الطلاب: ${levelOfStudent}",
                  style: TextStyle(color: yallowTextColor, fontSize: 18),
                  textAlign: TextAlign.center),
              Text(
                "عدد الطلاب ${numberOfStudent}",
                style: TextStyle(color: yallowTextColor, fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class JoinButton extends StatelessWidget {
  const JoinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => userScreen()));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(goldenColor),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      ),
      child: Text(
        "انضمام",
        style: TextStyle(
            fontSize: 22, color: yallowTextColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TimeForTsme3 extends StatelessWidget {
  const TimeForTsme3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "وقت التسميع",
              style: TextStyle(color: yallowTextColor, fontSize: 18),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: goldenColor,
                  ),
                  Text("الظهر",
                      style: TextStyle(color: yallowTextColor, fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: goldenColor,
                  ),
                  Text("الظهر",
                      style: TextStyle(color: yallowTextColor, fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: goldenColor,
                  ),
                  Text("الظهر",
                      style: TextStyle(color: yallowTextColor, fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void DisplayHalaqhCurriculm(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(11),
          ),
          height: 400,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 30,
                          color: goldenColor,
                        )),
                    Text(
                      "المنهج",
                      style: TextStyle(color: yallowTextColor, fontSize: 30),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 30,
                          color: goldenColor,
                        )),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Curriculum(
                        halaqhDays: 'الاحد',
                        nameOfSurah: 'الحج',
                        startVerse: 1,
                        endVerse: 5,
                      ),
                      Curriculum(
                        halaqhDays: 'الاثنين',
                        nameOfSurah: 'الحج',
                        startVerse: 5,
                        endVerse: 10,
                      ),
                      Curriculum(
                        halaqhDays: 'الثلاثاء',
                        nameOfSurah: 'الحج',
                        startVerse: 10,
                        endVerse: 15,
                      ),
                      // Curriculum(
                      //   halaqhDays: 'الاربعاء',
                      //   nameOfSurah: 'الحج',
                      //   startVerse: 15,
                      //   endVerse: 20,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                // JoinButton(),
                TimeForTsme3(),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
