// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/color.dart';
import 'package:frist_file_taj_alwaqar/Pages/Home_Std.dart';

class ChatItem extends StatelessWidget {
 String NameOfChatItem;

  ChatItem({super.key , required this.NameOfChatItem});
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: darkGreen,
            border: Border(
              bottom: BorderSide(
                color: goldenColor,
                width: 2.0,
              ),
            ),
          ),
          child: GestureDetector(
            child: ListTile(
              onTap: () {
              // Navigator.pushNamed(context, '/Home');
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        width: 15,
                      ),
                      Text(
                        NameOfChatItem,
                        style: TextStyle(color: yallowTextColor, fontSize: 28),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: goldenColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      
  }
}
