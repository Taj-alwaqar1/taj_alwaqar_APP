// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CahtItem.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';

 

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: Colors.black,
              height: 2.0,
            ),
          ),
          title: CustomAppBar("الرسائل"),
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
        ),
        drawer: SideBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ChatItem(
                NameOfChatItem: 'صالح',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context,'/NewMessagePAge');
          },
          backgroundColor: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
            side: BorderSide(color: Colors.black, width: 2.0),
          ),
          child: Image.asset(
            "assets/icon/email.png",
            width: 28.0,
            height: 28.0,
            color: goldenColor,
          ),
        ),
      ),
    );
  }
}
