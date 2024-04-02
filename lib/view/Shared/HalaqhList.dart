// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/search.dart';
import 'package:get/get.dart';
import '../../Controller/pagesController/createHalaqhController.dart';
import '../Pages/ChatGroupScr.dart';
import '../Pages/Halaqh.dart';
import '../Pages/TeacherDetail.dart';
import '../Shared/appBar.dart';
import '../Shared/color.dart';

import '../Shared/SideBar.dart';
import 'Curriculum.dart';

class HalaqhList extends StatelessWidget {
  const HalaqhList({super.key});

  @override
  Widget build(BuildContext context) {
    final HalaqhController Halaqhcontroller = Get.put(HalaqhController());

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
            leading: IconButton(
                onPressed: () {
                  Halaqhcontroller.HalaqhNames.clear();
                  navigator?.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: goldenColor,
                  size: 27,
                ))),
        body: Obx(
          () => ListView.builder(
            itemCount: Halaqhcontroller.HalaqhNames.length,
            itemBuilder: (BuildContext context, int index) {
              final halaqhName = Halaqhcontroller.HalaqhNames.value[index];
              var groupid = Halaqhcontroller.Halaqhids.value![index];
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
                              onTap: () async {
                                //send to halqah chat
                                await Halaqhcontroller.getvalueAndGoToChatGroup(
                                    groupid, halaqhName);

                                // print(groupid);
                                // DisplayHalaqhinfo(context);
                                DisplayHalaqhinfo(context, groupid, halaqhName);
                              },
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "الحلقة  ${halaqhName}", //variable
                                        style: TextStyle(
                                            color: yallowTextColor,
                                            fontSize: 28),
                                        softWrap: true,
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
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: botoom(),
      ),
    );
  }
}

DisplayHalaqhinfo(BuildContext context, groupid, halaqhName) {
  final HalaqhController Halaqhcontroller = Get.put(HalaqhController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(11),
          ),
          height: 550,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 450,
                width: double.infinity,
                // padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: goldenColor,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      halaqhName,
                      style: TextStyle(
                          color: yallowTextColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'xxxxxxxxxxxx',
                      style: TextStyle(
                          color: yallowTextColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'xxxxxxxxxxxx',
                      style: TextStyle(
                          color: yallowTextColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'xxxxxxxxxxxx',
                      style: TextStyle(
                          color: yallowTextColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor),
                    shadowColor: MaterialStateProperty.all(darkGreen),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: darkGreen))),
                  ),
                  onPressed: () {
                    // print(Halaqhcontroller.uid);
                    Get.to(GroupChatScreen());
                    Halaqhcontroller.addGroupUidToFirestore(
                        Halaqhcontroller.uid, groupid);
                    Halaqhcontroller.addUserToGroup(
                        groupid, Halaqhcontroller.uid);
                  },
                  child: Text(
                    'xxxxxxx',
                    style: TextStyle(
                        color: yallowTextColor,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      );
    },
  );
}
