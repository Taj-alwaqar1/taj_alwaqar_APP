// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, avoid_relative_lib_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/TabBarController.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/AI.dart';

import 'package:frist_file_taj_alwaqar/view/Pages/Chat.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Home_Std.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Home_Tec.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Quran.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';

import 'package:frist_file_taj_alwaqar/view/Shared/tabBarST.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Controller/sharedController/botoomNavController.dart';

class userScreen extends StatefulWidget {
  const userScreen({Key? key}) : super(key: key);

  @override
  State<userScreen> createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {


  final TabBarController controllerTabBar = Get.put(TabBarController());


  @override
  Widget build(BuildContext context) {
    final bottomNavnController controllernav = Get.put(bottomNavnController());

    return Scaffold(
      bottomNavigationBar: botoom(),
      body: PageView(
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        controller: controllernav.pageControllerindex,
        children: [
          AI(),
          Quran(),
          controllerTabBar.indexOfTabBar == 0 ? Home() : HomePageTec(),
          Chat(),
          CreateOrJoinHalaqh(),
        ],
      ),
    );
  }
}

Widget botoom() {
  final bottomNavnController controllernav = Get.put(bottomNavnController());
  return SizedBox(
    height: 100,
    child: Obx(
      () => CupertinoTabBar(
          backgroundColor: greenColor,
          onTap: (index) {
            controllernav.pageControllerindex.jumpToPage(index);
            controllernav.changepageindex(index);
            
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: controllernav.currentpage.value == 0
                          ? goldenColor
                          : greenColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset('assets/icon/machine-learning.png',
                      color: controllernav.currentpage.value == 0
                          ? greenColor
                          : goldenColor),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: controllernav.currentpage.value == 1
                          ? goldenColor
                          : greenColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(
                    'assets/icon/open-book.png',
                    color: controllernav.currentpage.value == 1
                        ? greenColor
                        : goldenColor,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: controllernav.currentpage.value == 2
                          ? goldenColor
                          : greenColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset('assets/icon/home.png',
                      color: controllernav.currentpage.value == 2
                          ? greenColor
                          : goldenColor),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  height: 48,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: controllernav.currentpage.value == 3
                          ? goldenColor
                          : greenColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset('assets/icon/envelope.png',
                      color: controllernav.currentpage.value == 3
                          ? greenColor
                          : goldenColor),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: controllernav.currentpage.value == 4
                          ? goldenColor
                          : greenColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(
                    'assets/icon/study.png',
                    color: controllernav.currentpage.value == 4
                        ? greenColor
                        : goldenColor,
                  ),
                ),
                label: ""),
          ]),
    ),
  );
}
