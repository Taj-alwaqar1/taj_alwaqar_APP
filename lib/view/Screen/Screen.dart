// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, avoid_relative_lib_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/AI.dart';

import 'package:frist_file_taj_alwaqar/view/Pages/Chat.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Halaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Home_Std.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Home_Tec.dart';
import 'package:frist_file_taj_alwaqar/view/Pages/Quran.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 

 


 
import 'package:frist_file_taj_alwaqar/view/Shared/tabBarST.dart';
import 'package:provider/provider.dart';
 
 

class userScreen extends StatefulWidget {
 const userScreen({Key? key}) : super(key: key);

  @override
  State<userScreen> createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {

  final PageController _pageController = PageController(initialPage: 2);

  int currentpage = 2;


  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      // final UserTypeIndex = Provider.of<PageIndex>(context);
       final UserTypeIndex = Provider.of<UserType>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: CupertinoTabBar(
            backgroundColor: greenColor,
            onTap: (index) {
              _pageController.jumpToPage(index);

              setState(() {
                currentpage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: currentpage == 0 ? goldenColor : greenColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      'assets/icon/machine-learning.png',
                      color: currentpage == 0 ? greenColor : goldenColor,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: currentpage == 1 ? goldenColor : greenColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      'assets/icon/open-book.png',
                      color: currentpage == 1 ? greenColor : goldenColor,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: currentpage == 2 ? goldenColor : greenColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      'assets/icon/home.png',
                      color: currentpage == 2 ? greenColor : goldenColor,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 48,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: currentpage == 3 ? goldenColor : greenColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      'assets/icon/envelope.png',
                      color: currentpage == 3 ? greenColor : goldenColor,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: currentpage == 4 ? goldenColor : greenColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      'assets/icon/study.png',
                      color: currentpage == 4 ? greenColor : goldenColor,
                    ),
                  ),
                  label: ""),
            ]),
      ),
      body: PageView(
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          AI(),
          Quran(),
           UserTypeIndex.indexOfTabBar == 0 ?   Home():HomePageTec(),
          Chat(),
          CreateOrJoinHalaqh(),
        ],
      ),
    );
  }
}

// class PageIndex with ChangeNotifier {
//    int indexOfPage=0;

//   tabControllerChange(int index) {
//     indexOfPage = index;
//     notifyListeners();
//   }
// }

