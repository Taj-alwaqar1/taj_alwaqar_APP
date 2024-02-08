// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/sideBarItem.dart';
 

 

Widget SideBar() {
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
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/img/person-icon-black-9.jpg")),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "صالح",
                      style: TextStyle(
                        fontSize: 30,
                        color: yallowTextColor,
                        fontWeight: FontWeight.bold,
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
          SideBarItem(itemTitle: 'انجازاتي', itemIcon: "assets/icon/sport.png"),
          SizedBox(
            height: 25,
          ),
          SideBarItem(itemTitle: 'الموقع', itemIcon: "assets/icon/mosque.png"),
          SizedBox(
            height: 25,
          ),
          SideBarItem(itemTitle: 'استعلام', itemIcon: "assets/icon/chat.png"),
          SizedBox(
            height: 25,
          ),
          SideBarItem(
              itemTitle: 'النمط الليلي',
              itemIcon: "assets/icon/night-mode.png"),
          SizedBox(
            height: 25,
          ),
          SideBarItem(
              itemTitle: 'الإعدادات',
              itemIcon: "assets/icon/settings.png"),
          SizedBox(
            height: 25,
          ),
          SideBarItem(
              itemTitle: 'تسجيل الخروج ',
              itemIcon: "assets/icon/logout.png"),
        ],
      ),
    ),
  );
}
