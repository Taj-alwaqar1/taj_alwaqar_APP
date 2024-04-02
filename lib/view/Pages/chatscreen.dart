// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../Controller/pagesController/callController.dart';
import '../../Controller/pagesController/messageController.dart';
import 'call.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerChat = Get.find<MessageController>();
    final callController = Get.put(CallController());
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: greenColor,
          title: Text(
            ControllerChat.to_name.value,
            style:
                TextStyle(color: yallowTextColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                callController.checkValue();
                await callController.actionButton();
                Get.to(() => CallScreen());
              },
              icon: Icon(Icons.video_call),
            ),
          ],
        ),
        body: SafeArea(
          child: SafeArea(
            child: Stack(
              children: [
                Container(child: ChatList()),
                Positioned(
                  bottom: 0,
                  height: 50,
                  child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: darkGreen,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: goldenColor,
                              size: 26,
                            )),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            controller: ControllerChat.textController,
                            autofocus: false,
                            focusNode: ControllerChat.contentnode,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              hintText: 'Write your message here...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              await ControllerChat.sendmsg();
                              await ControllerChat.displayMsg();
                            },
                            icon: Icon(
                              Icons.send,
                              color: goldenColor,
                              size: 26,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ChatRightItem(msgContent item) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    child: Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 230,
            maxHeight: 40,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10, top: 0),
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),
            child: item.type == "text"
                ? Text(
                    '${item.content}',
                    style: TextStyle(color: yallowTextColor),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 90,
                    ),
                  ),
          ),
        )
      ],
    ),
  );
}

Widget ChatLeftItem(msgContent item) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 230,
            maxHeight: 40,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10, top: 0),
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: item.type == "text"
                ? Text(
                    '${item.content}',
                    style: TextStyle(color: yallowTextColor),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 90,
                    ),
                  ),
          ),
        )
      ],
    ),
  );
}

class ChatList extends GetView<MessageController> {
  @override
  Obx build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          gradient: GradientGreen,
        ),
        padding: EdgeInsets.only(bottom: 50),
        child: CustomScrollView(
          reverse: false,
          controller: controller.msgScrolling,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // try {
                    if (controller.msgcontentList.isEmpty) {
                      return Center(
                          child: Text(
                              "No messages yet")); // Or a loading indicator
                    }
                    var item = controller.msgcontentList[index];
                    if (controller.currentUser_id == item.uid) {
                      return ChatRightItem(item);
                    }
                    return ChatLeftItem(item);
                  },
                  childCount: controller.msgcontentList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

