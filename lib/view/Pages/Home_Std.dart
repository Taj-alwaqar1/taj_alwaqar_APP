// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/homeListController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/search.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeListController controller = Get.put(HomeListController());

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
                  size: 40, color: goldenColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(searchPage());
                },
                icon: Icon(
                  Icons.search,
                  color: goldenColor,
                  size: 40,
                ))
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.teachersName.length,
            itemBuilder: (BuildContext context, int index) {
              final teacherName = controller.teachersName.value[index];

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
                                // Navigator.pushNamed(
                                //     context, '/teacherDetail'); // hhh
                              },
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(55),
                                          color: greenColor,
                                          border: Border.all(
                                              color: goldenColor, width: 2),
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
                                        "المعلم: ${teacherName}", //variable
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
        drawer: SideBar(),
      ),
    );
  }
}
