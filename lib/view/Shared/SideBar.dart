// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/sideBarController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBarAccount.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/sideBarItem.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getStudentData.dart';

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
                ElevatedButton(
                  onPressed: () async{
                    GetData getDatauser = Get.put(GetData());
                   await getDatauser.getUserAttributes();
                    Get.to(() => Account_Info());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(greenColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: greenColor,
                          radius: 30,
                          backgroundImage: AssetImage("assets/img/avatar.png")),
                      SizedBox(
                        width: 25,
                      ),
                      Obx(
                        () => Text(
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
