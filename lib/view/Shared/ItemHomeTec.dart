// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';

import '../../Controller/pagesController/Home_TecController.dart';
import '../Screen/Screen.dart';

class HomeTecItem extends StatelessWidget {
  const HomeTecItem({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeTeacherController HomeTeachercontroller =
        Get.put(HomeTeacherController());

    return Container(
        decoration: const BoxDecoration(
          gradient: GradientGreen,
        ),
        child: Scaffold(
            appBar: AppBar(
                title: CustomAppBar("الطلاب"),
                centerTitle: true,
                backgroundColor: darkGreen,
                leading: IconButton(
                    onPressed: () {
                      HomeTeachercontroller.ClearmemberNames();
                      navigator?.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: goldenColor,
                      size: 27,
                    ))),
            backgroundColor: Colors.transparent,
            body: Obx(
              () => ListView.builder(
                  itemCount: HomeTeachercontroller.memberNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String CurrentName =
                        HomeTeachercontroller.memberNames.value[index];
                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            ItemHalaqh(stdName: CurrentName,index: index+1),
                          ],
                        ),
                      ),
                    );
                  }),
            )));
  }
}

class ItemHalaqh extends StatelessWidget {
  String stdName;
  int index;
  ItemHalaqh({super.key, required this.stdName,required this.index});

  @override
  Widget build(BuildContext context) {
    final HomeTeacherController HomeTeachercontroller =
        Get.put(HomeTeacherController());

    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: darkGreen,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: greenColor,
                ),
                child: Center(
                  child: Text(
                  "${index}",
                    style: TextStyle(
                      color: goldenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              index==1?Text(
                "المعلم : ${stdName}",
                style: TextStyle(
                  color: yallowTextColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ):
              Text(
                stdName,
                style: TextStyle(
                  color: yallowTextColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Icon(
          //   Icons.check_circle,
          //   color: goldenColor,
          //   size: 26,
          // ),
        ],
      ),
    );
  }
}
