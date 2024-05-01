// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CahtItem.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';
import 'package:get/get.dart';

import '../../Controller/pagesController/callController.dart';
import '../../Controller/pagesController/messageController.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {

    final ControllerChat = Get.put(MessageController());
    final callController = Get.put(CallController());
 
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
        body: Obx(
          () => ListView.builder(
            itemCount: ControllerChat.userName.length,
            itemBuilder: (BuildContext context, int index) {
              final userName = ControllerChat.userName.value[index];
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
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
                            onTap: () async{
                              final id =
                                  ControllerChat.useridMethode[index];
                              if (id!=null) {
                                 ControllerChat.navigateToChatScreen(
                                  userName, id);
                                 ControllerChat.displayMsg();
                                 callController.getvalue(id,userName);
                                await callController. checkValue();
                                callController.makeCall();
                              }
                             
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
                                      userName.split(' ')[0],
                                      style: TextStyle(
                                          color: yallowTextColor, fontSize: 28,),
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
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/NewMessagePAge');
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
