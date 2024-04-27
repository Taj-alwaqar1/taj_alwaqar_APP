// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
import '../../Controller/pagesController/callController.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../Controller/sharedController/sideBarController.dart';
class callPickupScreen extends StatelessWidget {
  final Widget scaffold;

  const callPickupScreen({super.key, required this.scaffold});
  @override
  Widget build(BuildContext context) {
    
    final callcontroller = Get.put(CallController());
    return StreamBuilder(
        stream: callcontroller.callStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.data() != null) {
            Call call =
                Call.fromMap(snapshot.data!.data() as Map<String, dynamic>);
            if (!call.hasDialled) {
              return Scaffold(
                body: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(gradient: GradientGreen),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Incoming Call ',
                        style: TextStyle(fontSize: 44, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(call.callerName,
                          style: TextStyle(
                              fontSize: 25,
                              color: yallowTextColor,
                              fontWeight: FontWeight.w900)),
                      SizedBox(
                        height: 75,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {  },
                            icon: const Icon(Icons.call_end,
                                color: Colors.redAccent,size: 40,),
                          ),
                          const SizedBox(width: 25),
                          IconButton(
                            onPressed: ()async {
                             await callcontroller.getInfoFromCall(call.callId, call, false);
                              Get.to(CallScreen);                  
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => CallScreen(
                            //         channelId: call.callId,
                            //         call: call,
                            //         isGroupChat: false,
                            //       ),
                            //     ),
                            //   );
                            },
                            icon: const Icon(
                              Icons.call,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          }
          return scaffold;
        });
  }
}
class CallScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  final callController=Get.put(CallController()); 
  final  SideBarcontroller = Get.put(sideBarController());
   return    ZegoUIKitPrebuiltCall(
    //yourAppID
        appID: 854672523,
        //yourAppSign
        appSign: 'b63638c3d66febae618bfe2ca9af6c860cf8e5ce953b23d7aa9821e4e39e25c5' ,
        userID:  SideBarcontroller.username.value,
        //here will showen in left bottom
        userName: SideBarcontroller.username.value,
        callID:callController.CallId.value,
        plugins: [ZegoUIKitSignalingPlugin()],
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
         ..topMenuBar.isVisible = true
          ..topMenuBar.buttons = [
            // ZegoCallMenuBarButtonName.minimizingButton,
            ZegoCallMenuBarButtonName.showMemberListButton,
          ],
  );
}
}

