// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/TabBarController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
 
// import 'package:provider/provider.dart';


class StudentOrTeacher extends StatelessWidget {
  StudentOrTeacher({super.key});
      final TabBarController controllerTabBar = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {

  controllerTabBar.initState();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: greenColor,
              ),
              child: TabBar(
                // unselectedLabelColor: yallowTextColor,
                labelColor: yallowTextColor,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.black12,
                ),
                controller: controllerTabBar.tabController,
                onTap: (value)  {
                   controllerTabBar.tabControllerChange(value);
                },
                tabs: [
                  Tab(
                    child: Text(
                      'طالب',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'معلم',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Expanded(
//                     child: TabBarView(
//                       controller: tabController,
//                       children: [SignIn(), Login()],
//                     ),
//                   ),
// class UserType with ChangeNotifier {
//    int indexOfTabBar=0;

//   tabControllerChange(int index) {
//     indexOfTabBar = index;
//     notifyListeners();
//   }
// }
