// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';

import 'package:frist_file_taj_alwaqar/view/Shared/ItemHomeTec.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';
import 'package:get/get.dart';

import '../../Controller/pagesController/Home_TecController.dart';

class HomePageTec extends StatelessWidget {
  const HomePageTec({super.key});


  @override
  Widget build(BuildContext context) {
  final HomeTeacherController HomeTeachercontroller = Get.put(HomeTeacherController());
      // HomeTeachercontroller.();
    return Container(
        decoration: const BoxDecoration(
          gradient: GradientGreen,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: CustomAppBar("الطلاب"),
            backgroundColor: darkGreen,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.account_circle_rounded,
                    size: 40, color: goldenColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(
                    Icons.search,
                    color: goldenColor,
                    size: 40,
                  ))
            ],
          ),
          drawer: SideBar(),
          body:
                Obx(
                 () =>
              ListView.builder(
                //here will be num of halaqhs 
            itemCount: HomeTeachercontroller.OwnHalaqh.length,
            itemBuilder: (BuildContext context, int index) {
              final OwnHalaqhName = HomeTeachercontroller.OwnHalaqh.value[index];
              final OwnHalaqhids = HomeTeachercontroller.OwnHalaqhids.value[index];
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              onTap: () async{
                                //here action 
                                print(OwnHalaqhids);
                             await  HomeTeachercontroller.getMemberIDs(OwnHalaqhids);
                                Get.to(()=> HomeTecItem());
                               
                                
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
                                        OwnHalaqhName, //variable
                                         maxLines:1,
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
          )
        ));
  }
}
