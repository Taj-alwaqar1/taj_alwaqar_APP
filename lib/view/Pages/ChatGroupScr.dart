// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/messageController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../Controller/pagesController/createHalaqhController.dart';
import '../../Model/GetUserData/getMessage.dart';

class GroupChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ControllerChat = Get.put(MessageController());
    HalaqhController Halaqhcontroller = Get.put(HalaqhController());
    // Halaqhcontroller. checkAndReturnGroupUid();
    Halaqhcontroller.GetHalaqhName(Halaqhcontroller.GroupUid.value);
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: darkGreen,
            title: Obx(
              () => Text(Halaqhcontroller.currenthalaqhName.value,
                  style: TextStyle(
                      color: yallowTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 33)),
            ),

            centerTitle: true,
            // actions: [
            //   IconButton(
            //     onPressed: () => makeCall(context),
            //     icon: const Icon(Icons.video_call),
            //   ),
            // ],
          ),
          body: SafeArea(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(child: ChatListGroup()),
                  Positioned(
                    bottom: 0,
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
                              onPressed: () {
                                Halaqhcontroller.GetHalaqhName(
                                    Halaqhcontroller.GroupUid);
                              },
                              icon: Icon(
                                Icons.add,
                                color: goldenColor,
                                size: 26,
                              )),
                          Container(
                            width: 300,
                            child: TextField(
                              onChanged: (value) {},
                              controller: ControllerChat.textControllerGroup,
                              autofocus: false,
                              focusNode: ControllerChat.contentnodeGroup,
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
                                ControllerChat.sendTextMessage(
                                  context: context,
                                  text: ControllerChat.textControllerGroup.text,
                                  recieverUserId:
                                      Halaqhcontroller.currenthalaqhId.value,
                                );
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

                // Container(
                //   width: 400,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     border: Border(
                //       top: BorderSide(
                //         color: darkGreen,
                //         width: 1,
                //       ),
                //     ),
                //   ),

                //     child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // children: [
                //   IconButton(
                //       onPressed: () {},
                //       icon: Icon(
                //         Icons.add,
                //         color: goldenColor,
                //         size: 26,
                //       )),
                // TextField(
                //   onChanged: (value) {},
                //   controller: ControllerChat.textControllerGroup,
                //   autofocus: false,
                //   focusNode: ControllerChat.contentnodeGroup,
                //   decoration: InputDecoration(
                //     contentPadding: EdgeInsets.symmetric(
                //       vertical: 10,
                //       horizontal: 20,
                //     ),
                //     hintText: 'Write your message here...',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       borderSide: BorderSide(
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
                //       IconButton(
                //           onPressed: () async {
                //             ControllerChat.sendTextMessage(
                //               context: context,
                //               text: ControllerChat.textControllerGroup.text,
                //               recieverUserId:
                //                   Halaqhcontroller.currenthalaqhId.value,
                //             );
                //           },
                //           icon: Icon(
                //             Icons.send,
                //             color: goldenColor,
                //             size: 26,
                //           ))
                //     ],
                //   ),
                // ),
              ),
            ),
          )),
    );
  }
}

class ChatListGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController messageControllerscroll = ScrollController();
    MessageController messageController = Get.put(MessageController());
    HalaqhController halaqhController = Get.put(HalaqhController());

    halaqhController.GiveHalaqhIdValue();

    return StreamBuilder<List<MessageGroup>>(
        stream: messageController
            .groupChatStream(halaqhController.currenthalaqhId.value),
        builder: (context, snapshot) {
          final FirebaseAuth auth = FirebaseAuth.instance;
          if (snapshot.hasData) {
            final List<MessageGroup> messageGroups = snapshot.data!;
            return ListView.builder(
              controller: messageControllerscroll,
              itemCount: messageGroups.length,
              itemBuilder: (context, index) {
                // final MessageGroup messageGroup = messageGroups[index];
                final messageData = messageGroups[index];

                if (messageData.senderId == auth.currentUser!.uid) {
                  return Container(child: MyMessageCard(messageData));
                }
                return Container(child: SenderMessageCard(messageData));
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

// class ChatListGroup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final ScrollController messageController = ScrollController();
//     MessageController Messagecontroller = Get.put(MessageController());
//     HalaqhController Halaqhcontroller = Get.put(HalaqhController());
//     return StreamBuilder<List<MessageGroup>>(
//         stream: Messagecontroller.groupChatStream(
//             Halaqhcontroller.currenthalaqhId.value),
//         builder: (context, snapshot) {
//           final FirebaseAuth Auth = FirebaseAuth.instance;
//           return ListView.builder(
//             controller: messageController,
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final messageData = snapshot.data![index];

//               if (messageData.senderId == Auth.currentUser!.uid) {
//                 return MyMessageCard(messageData);
//               }
//               return SenderMessageCard(messageData);
//             },
//           );
//         });
//   }
// }

Widget MyMessageCard(messageData) {
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
            maxHeight: 60,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10, top: 0),
                padding:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
                decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )),
                child: Text(
                  '${messageData.text}',
                  style: TextStyle(color: yallowTextColor),
                ),
              ),
              //   Text(
              //         '${messageData.}',
              //         style: TextStyle(color: yallowTextColor),

              //       ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget SenderMessageCard(messageData) {
  // final isReplying = messageData.repliedText.isNotEmpty;
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
            child: Text(
              '${messageData.text}',
              style: TextStyle(color: yallowTextColor),
            ),
          ),
        )
      ],
    ),
  );
}
