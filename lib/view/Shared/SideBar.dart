// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/sideBarController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/sideBarItem.dart';
import 'package:get/get.dart';

Widget SideBar() {
  final sideBarController controller = Get.put(sideBarController());
  return Drawer(
    child: Container(
      color: greenColor,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: Colors.black), // Adjust properties as needed
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                        radius: 30, 
                        backgroundImage:
                            AssetImage("assets/img/avatar.png")),
                    SizedBox(
                      width: 25,
                    ),
                    Obx(()=>
                       Text(
                      controller.username.value, 
                        style: TextStyle(
                          fontSize: 30,
                          color: yallowTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            onTap: () {
             
            },
            title: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/icon/sport.png"),
                  color: goldenColor,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "انجازاتي",
                  style: SideBarItemsstyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/icon/mosque.png"),
                  color: goldenColor,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "الموقع",
                  style: SideBarItemsstyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/icon/chat.png"),
                  color: goldenColor,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "استعلام",
                  style: SideBarItemsstyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/icon/night-mode.png"),
                  color: goldenColor,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "النمط الليلي",
                  style: SideBarItemsstyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/icon/settings.png"),
                  color: goldenColor,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  " الإعدادات",
                  style: SideBarItemsstyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            onTap: () {
              controller.signOut();
            },
            title: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/icon/logout.png"),
                  color: goldenColor,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  " تسجيل الخروج ",
                  style: SideBarItemsstyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    ),
  );
}
