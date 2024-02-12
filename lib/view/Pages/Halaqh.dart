// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';

// class halaqh extends StatelessWidget {
//   const halaqh({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
// decoration: BoxDecoration(
//   gradient: GradientGreen,
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: CustomAppBar("الحلقات"),
//           backgroundColor: darkGreen,
//           leading: Builder(
//             builder: (context) => IconButton(
//               icon: Icon(Icons.account_circle_rounded,
//                   size: 40, color: goldenColor),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             ),
//           ),
//         ),
//         drawer: SideBar(),
//         body: SingleChildScrollView(
//           child: Column(children: [
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//             HalaqhList(
//               HalaqhName: ' عثمان بن عفان',
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

class CreateOrJoinHalaqh extends StatelessWidget {
  const CreateOrJoinHalaqh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 500,
            width: 500,
            child: Stack(
              children: [
                Positioned(
                    top: 50,  
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "لا يوجد حلقة قم بإنشاء او انضم لحلقة",
                          style: TextStyle(
                              color: yallowTextColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ))),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => userScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(goldenColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                      ),
                      child: Text(
                        " انشاء حلقة",
                        style: TextStyle(
                            fontSize: 22,
                            color: yallowTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => userScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(goldenColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                      ),
                      child: Text(
                        " انضمام لحلقة",
                        style: TextStyle(
                            fontSize: 22,
                            color: yallowTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
