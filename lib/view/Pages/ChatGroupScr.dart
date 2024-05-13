// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/messageController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../Controller/pagesController/createHalaqhController.dart';
import '../../Model/GetUserData/getMessage.dart';
import '../Shared/Curriculum.dart';
import '../Shared/HalaqhList.dart';
import 'TeacherDetail.dart';

class GroupChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ControllerChat = Get.put(MessageController());
    HalaqhController Halaqhcontroller = Get.put(HalaqhController());
    // Halaqhcontroller. checkAndReturnGroupUid();displaySyllabuses
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
            leading: IconButton(
              onPressed: () async {
                print('xxxxxxxxxxx${Halaqhcontroller.GroupUid.value}');
                await Halaqhcontroller.displaySyllabuses(
                    Halaqhcontroller.GroupUid.value);

                DisplayHalaqhCurriculmSpecificForOwnHalaqh(context);
              },
              icon: Icon(
                Icons.calendar_month,
                color: goldenColor,
                size: 29,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.video_call,
                  color: goldenColor,
                  size: 26,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: ChatListGroup()),
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
                                // Halaqhcontroller.GetHalaqhName(
                                //     Halaqhcontroller.GroupUid);
                              },
                              icon: Icon(
                                Icons.add,
                                color: goldenColor,
                                size: 26,
                              )),
                          Container(
                            width: 300,
                            // height: 200,
                            // margin: EdgeInsets.only(t),
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
                                hintText: 'اكتب رسالتك هنا ...',
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
                                ControllerChat.textControllerGroup.clear();
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

DisplayHalaqhCurriculmSpecificForOwnHalaqh(BuildContext context) {
  HalaqhController Halaqhcontroller = Get.put(HalaqhController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(11),
          ),
          height: 400,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 30,
                          color: goldenColor,
                        )),
                    Center(
                      child: Text(
                        "المنهج",
                        style: TextStyle(color: yallowTextColor, fontSize: 30),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 30,
                          color: goldenColor,
                        )),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Curriculum(
                        halaqhDays: Halaqhcontroller.syllabusDays.value[2],
                        nameOfSurah: Halaqhcontroller.nameOfSurah.value[2],
                        startVerse: Halaqhcontroller.startVerses.value[2],
                        endVerse: Halaqhcontroller.endVerses.value[2],
                      ),
                      Curriculum(
                        halaqhDays: Halaqhcontroller.syllabusDays.value[1],
                        nameOfSurah: Halaqhcontroller.nameOfSurah.value[1],
                        startVerse: Halaqhcontroller.startVerses.value[1],
                        endVerse: Halaqhcontroller.endVerses.value[1],
                      ),
                      Curriculum(
                        halaqhDays: Halaqhcontroller.syllabusDays.value[0],
                        nameOfSurah: Halaqhcontroller.nameOfSurah.value[0],
                        startVerse: Halaqhcontroller.startVerses.value[0],
                        endVerse: Halaqhcontroller.endVerses.value[0],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                // JoinButton(),
                // TimeForTsme3(),
                // SizedBox(
                //   height: 22,
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
