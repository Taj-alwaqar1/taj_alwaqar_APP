// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:frist_file_taj_alwaqar/Controller/HalaqhController/createHalaqhController.dart';
// import 'package:frist_file_taj_alwaqar/view/Pages/DisplayHalaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CustomTextFeild.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/HalaqhList.dart';
// import 'package:frist_file_taj_alwaqar/view/Shared/Ha.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/pagesController/createHalaqhController.dart';

class CreateOrJoinHalaqh extends StatelessWidget {
  const CreateOrJoinHalaqh({super.key});

  @override
  Widget build(BuildContext context) {
    final HalaqhController controller = Get.put(HalaqhController());

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
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              decoration: BoxDecoration(
                                gradient: GradientGreen,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(27.74)),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Form(
                                  key: controller.HalaqhFormKey,
                                  child: Column(
                                    children: [
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              controller: controller
                                                  .mosqueNameController,
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: fieldsForInfovarHalaqh
                                                  .copyWith(
                                                      labelText: 'اسم المسجد'),
                                              onSaved: (value) {
                                                controller.mosqueNameController
                                                    .text = value!;
                                              },
                                              validator: (value) {
                                                return controller
                                                    .validateMosqueName(value!);
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              controller: controller
                                                  .halqahNameController,
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: fieldsForInfovarHalaqh
                                                  .copyWith(
                                                      labelText: 'اسم الحلقة'),
                                              onSaved: (value) {
                                                controller.halqahNameController
                                                    .text = value!;
                                              },
                                              validator: (value) {
                                                return controller
                                                    .validateHalaqhName(value!);
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              controller: controller
                                                  .teacherNameController,
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: fieldsForInfovarHalaqh
                                                  .copyWith(
                                                      labelText: 'اسم المدرس'),
                                              onSaved: (value) {
                                                controller.teacherNameController
                                                    .text = value!;
                                              },
                                              validator: (value) {
                                                // return controller.ValidateAgeFeild(value!);
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              //  border: Border.all(color: yallowTextColor,width: 2)
                                            ),
                                            child: TextFormField(
                                              controller: controller
                                                  .halaqhDaysController,
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: fieldsForInfovarHalaqh
                                                  .copyWith(
                                                      labelText:
                                                          ' ايام الحلقة'),
                                              onSaved: (value) {
                                                controller.halaqhDaysController
                                                    .text = value!;
                                              },
                                              validator: (value) {
                                                // return controller.ValidateAgeFeild(value!);
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              //  border: Border.all(color: yallowTextColor,width: 2)
                                            ),
                                            child: TextFormField(
                                              controller: controller
                                                  .halqahTimeController,
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: fieldsForInfovarHalaqh
                                                  .copyWith(
                                                      labelText: 'وقت الحلقة'),
                                              onSaved: (value) {
                                                controller.halqahTimeController
                                                    .text = value!;
                                              },
                                              validator: (value) {
                                                // return controller.ValidateAgeFeild(value!);
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {}, //location
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        goldenColor),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25,
                                                            vertical: 10)),
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25))),
                                              ),
                                              child: Text(
                                                "موقع الحلقة",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: yallowTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          darkGreen,
                                                      surfaceTintColor:
                                                          darkGreen,
                                                      title: Center(
                                                          child: CustomAppBar(
                                                              "المنهج ")),
                                                      content: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              GradientGreen,
                                                        ),
                                                        width: 400,
                                                        height: double.infinity,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: 200,
                                                                height: 150,
                                                                color:
                                                                    goldenColor,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            30),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            20),
                                                                    Text(
                                                                      "الاحد",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "سورة : الحج",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "من ١ الى ١٥",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                width: 200,
                                                                height: 150,
                                                                color:
                                                                    goldenColor,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            30),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            20),
                                                                    Text(
                                                                      "الاثنين",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "سورة : الحج",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "من ١٥ الى ٣٠",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                width: 200,
                                                                height: 150,
                                                                color:
                                                                    goldenColor,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            30),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            20),
                                                                    Text(
                                                                      "الاثنين",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "سورة : الحج",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "من ١٥ الى ٣٠",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                  width: 150,
                                                                  height: 60,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: ElevatedButton(
                                                                      onPressed: () {}, // اضافة
                                                                      child: Text(
                                                                        "تعديل",
                                                                        style: TextStyle(
                                                                            color:
                                                                                yallowTextColor,
                                                                            fontSize:
                                                                                28,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(goldenColor)))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        goldenColor),
                                                padding:
                                                    MaterialStateProperty.all(
                                                  EdgeInsets.symmetric(
                                                      horizontal: 25,
                                                      vertical: 10),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                " انشاء منهج",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  color: yallowTextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      GetBuilder<HalaqhController>(
                                        builder: (controller) => ElevatedButton(
                                          onPressed: () {
                                            controller.checkCreateHalaqh();
                                            // Get.to(DisplayHalaqh());
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    goldenColor),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                    horizontal: 80,
                                                    vertical: 10)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25))),
                                          ),
                                          child: Text(
                                            "انشاء",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: yallowTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
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
                        Get.to(HalaqhList());
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
