// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CustomTextFeild.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';
import 'package:get/get.dart';

import '../../Controller/sharedController/sideBarController.dart';
import '../../Model/GetUserData/getStudentData.dart';
import '../../Model/sendDataToStore/SendUserData.dart';

class Account_Info extends StatelessWidget {
  const Account_Info({super.key});

  @override
  Widget build(BuildContext context) {
 
    sideBarController SideBarController = Get.put(sideBarController());
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: darkGreen,
          title: CustomAppBar("الصفحة الشخصية"),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  // Get.off(userScreen());
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: goldenColor,
                ));
          }),
        ),
        // body:
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: GradientGreen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80),
              topRight: Radius.circular(80),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: goldenColor,
                  size: 100,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 50, 5, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80),
                    ),
                  ),
                  child: Obx(
                   ()=> Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextFormField(
                                  controller:
                                      SideBarController.firstnameController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: fieldsForAccountUser.copyWith(
                                    labelText:
                                        SideBarController.firstname.value.isNotEmpty
                                            ? SideBarController.firstname.value
                                            : 'الاسم',
                                  ),
                                  onSaved: (value) {
                                    // Save the value
                                  },
                                  validator: (value) {
                                    // Perform validation
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(20),
                                //  border: Border.all(color: yallowTextColor,width: 2)
                              ),
                              child: TextFormField(
                                controller: SideBarController.emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: fieldsForAccountUser.copyWith(
                                    labelText: SideBarController.email.value.isNotEmpty
                                        ? SideBarController.email.value
                                        : 'البريد الالكتروني '),
                                onSaved: (value) {
                                  // controller.emailController.text = value!;
                                },
                                validator: (value) {
                                  // return controller.validateEmail(value!);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(20),
                                //  border: Border.all(color: yallowTextColor,width: 2)
                              ),
                              child: TextFormField(
                                controller:
                                    SideBarController.phonenumberController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: fieldsForAccountUser.copyWith(
                                    labelText:
                                        SideBarController.phonenumber.value.isNotEmpty
                                            ? SideBarController.phonenumber.value
                                            : 'رقم الهاتف '),
                                onSaved: (value) {
                                  // controller.emailController.text = value!;
                                },
                                validator: (value) {
                                  // return controller.validateEmail(value!);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // Directionality(
                        //   textDirection: TextDirection.rtl,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 16),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: greenColor,
                        //         borderRadius: BorderRadius.circular(20),
                        //         //  border: Border.all(color: yallowTextColor,width: 2)
                        //       ),
                        //       child: TextFormField(
                        //         // controller: controller.emailController,
                        //         keyboardType: TextInputType.emailAddress,
                        //         textInputAction: TextInputAction.next,
                        //         obscureText: false,
                        //         decoration: fieldsForAccountUser.copyWith(
                        //             labelText: 'العنوان '),
                        //         onSaved: (value) {
                        //           // controller.emailController.text = value!;
                        //         },
                        //         validator: (value) {
                        //           // return controller.validateEmail(value!);
                        //         },
                        //         autovalidateMode:
                        //             AutovalidateMode.onUserInteraction,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        // Directionality(
                        //   textDirection: TextDirection.rtl,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 16),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: greenColor,
                        //         borderRadius: BorderRadius.circular(20),
                        //         //  border: Border.all(color: yallowTextColor,width: 2)
                        //       ),
                        //       child: TextFormField(
                        //         // controller: controller.emailController,
                        //         keyboardType: TextInputType.emailAddress,
                        //         textInputAction: TextInputAction.next,
                        //         obscureText: false,
                        //         decoration: fieldsForAccountUser.copyWith(
                        //             labelText: 'الجنس '),
                        //         onSaved: (value) {
                        //           // controller.emailController.text = value!;
                        //         },
                        //         validator: (value) {
                        //           // return controller.validateEmail(value!);
                        //         },
                        //         autovalidateMode:
                        //             AutovalidateMode.onUserInteraction,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        Container(
                            width: 150,
                            height: 60,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                                onPressed: ()async {
                                 
                                await  SideBarController.updateFirebaseValue(
                                      SideBarController.firstnameController.text,
                                      SideBarController.emailController.text,
                                      SideBarController
                                          .phonenumberController.text);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(goldenColor)),
                                child: Text(
                                  "تعديل",
                                  style: TextStyle(
                                      color: yallowTextColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ))),
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
