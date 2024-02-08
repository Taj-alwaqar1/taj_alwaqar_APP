// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 
import 'package:provider/provider.dart';


class StudentOrTeacher extends StatefulWidget {
  StudentOrTeacher({super.key});

  @override
  _StudentOrTeacherState createState() => _StudentOrTeacherState();
}

class _StudentOrTeacherState extends State<StudentOrTeacher>
    with SingleTickerProviderStateMixin {
   late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserTypeIndex = Provider.of<UserType>(context);
    UserTypeIndex.indexOfTabBar = tabController.index;
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
                controller: tabController,
                onTap: (value) {
                  UserTypeIndex.tabControllerChange(value);
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
class UserType with ChangeNotifier {
   int indexOfTabBar=0;

  tabControllerChange(int index) {
    indexOfTabBar = index;
    notifyListeners();
  }
}
