// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';

  
class NewMessagePAge extends StatefulWidget {
  const NewMessagePAge({super.key});

  @override
  State<NewMessagePAge> createState() => _NewMessagePAgeState();
}

class _NewMessagePAgeState extends State<NewMessagePAge> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: GradientGreen,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: CustomAppBar("رسالة جديدة"),
            backgroundColor: darkGreen,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "إلغاء",
                    style: TextStyle(fontSize: 26, color: yallowTextColor),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: CupertinoSearchTextField(
                      prefixInsets:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: goldenColor, width: 1),
                      ),
                      prefixIcon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: goldenColor,
                            border: Border.all(
                              color: goldenColor,
                            ),
                          ),
                          child: Icon(
                            CupertinoIcons.search,
                            color: greenColor,
                            size: 30,
                          ))),
                ),
                Letter(letterSearch: "أ"),
                SizedBox(
                  height: 8,
                ),
                namesOfUser(
                  userName: "أسامة",
                )
              ],
            ),
          ),
        ));
  }
}

class Letter extends StatelessWidget {
  String letterSearch;
  Letter({super.key, required this.letterSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        letterSearch[0],
        style: TextStyle(
            fontSize: 29, color: yallowTextColor, fontWeight: FontWeight.bold),
        // textDirection: TextDirection.ltr,
      ),
    );
  }
}

// ignore: camel_case_types
class namesOfUser extends StatelessWidget {
  String userName;
  // String itemIcon;
  namesOfUser({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: greenColor,
                      border: Border.all(color: goldenColor, width: 2),
                    ),
                    child: Icon(
                      Icons.person,
                      color: goldenColor,
                      size: 33,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                     maxLines:1,
                    userName,
                    style: TextStyle(color: yallowTextColor, fontSize: 28),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: goldenColor,
                    width: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


