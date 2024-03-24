// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:frist_file_taj_alwaqar/Controller/sharedController/SaveSyllaubsDataControler.dart';
// import 'package:frist_file_taj_alwaqar/Controller/HalaqhController/createHalaqhController.dart';
// import 'package:frist_file_taj_alwaqar/view/Pages/DisplayHalaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CustomTextFeild.dart';
// import 'package:frist_file_taj_alwaqar/view/Shared/DisplayHalaqh.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/DropMenu.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/HalaqhList.dart';
// import 'package:frist_file_taj_alwaqar/view/Shared/Ha.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/pagesController/SaveSyllaubsDataControler.dart';
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
                        BottomSheet(context);
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

void BottomSheet(BuildContext context) {
  final HalaqhController controller = Get.put(HalaqhController());
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          gradient: GradientGreen,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: controller.mosqueNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovarHalaqh.copyWith(
                            labelText: 'اسم المسجد'),
                        onSaved: (value) {
                          controller.mosqueNameController.text = value!;
                        },
                        validator: (value) {
                          return controller.validateMosqueName(value!);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: controller.halqahNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovarHalaqh.copyWith(
                            labelText: 'اسم الحلقة'),
                        onSaved: (value) {
                          controller.halqahNameController.text = value!;
                        },
                        validator: (value) {
                          return controller.validateHalaqhName(value!);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: controller.teacherNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovarHalaqh.copyWith(
                            labelText: 'اسم المدرس'),
                        onSaved: (value) {
                          controller.teacherNameController.text = value!;
                        },
                        validator: (value) {
                          // return controller.ValidateAgeFeild(value!);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                DaysHalaqhDropMenu(),
                SizedBox(
                  height: 40,
                ),
                TimesHalaqhDropMenu(),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {}, //location
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(goldenColor),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        child: Text(
                          "موقع الحلقة",
                          style: TextStyle(
                              fontSize: 22,
                              color: yallowTextColor,
                              fontWeight: FontWeight.bold),
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
                                actions: [
                                  Center(
                                    child: Container(
                                        width: 150,
                                        height: 60,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ElevatedButton(
                                            onPressed: () {}, // اضافة
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        goldenColor)),
                                            child: Text(
                                              "اضافة",
                                              style: TextStyle(
                                                  color: yallowTextColor,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                  ),
                                ],
                                backgroundColor: darkGreen,
                                surfaceTintColor: darkGreen,
                                title: Center(child: CustomAppBar("المنهج ")),
                                // contentPadding: EdgeInsets.all(20),
                                content: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    gradient: GradientGreen,
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ContainerSylaubs(context),
                                        SizedBox(width: 20),
                                        ContainerSylaubs2(context),
                                        SizedBox(width: 20),
                                        ContainerSylaubs1(context),
                                        SizedBox(width: 20),
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
                              MaterialStateProperty.all(goldenColor),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
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
                  height: 30,
                ),
                GetBuilder<HalaqhController>(
                  builder: (controller) => ElevatedButton(
                    onPressed: () {
                      controller.checkCreateHalaqh();
                      Get.toNamed('/DisplayHalaqh');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(goldenColor),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 80, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
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
}

Container ContainerSylaubs(BuildContext context) {
  final CreateSylaubsController controller = Get.put(CreateSylaubsController());
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      gradient: GradientGreen,
    ),
    width: 250,
    height: 300,
    margin: EdgeInsets.all(15),
    alignment: Alignment.topCenter,
    child: Form(
      key: controller.CreateSylaubsFormKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration:
                        fieldsForCreateSylabus.copyWith(labelText: 'اليوم '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'اسم السوره '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'رقم بداية الاية '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'رقم نهاية الاية '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Container ContainerSylaubs2(BuildContext context) {
  final CreateSylaubsController controller = Get.put(CreateSylaubsController());
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      gradient: GradientGreen,
    ),
    width: 250,
    height: 300,
    margin: EdgeInsets.all(15),
    alignment: Alignment.topCenter,
    child: Form(
      key: controller.CreateSylaubsFormKey2,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration:
                        fieldsForCreateSylabus.copyWith(labelText: 'اليوم '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'اسم السوره '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'رقم بداية الاية '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'رقم نهاية الاية '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Container ContainerSylaubs1(BuildContext context) {
  final CreateSylaubsController controller = Get.put(CreateSylaubsController());
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      gradient: GradientGreen,
    ),
    width: 250,
    height: 300,
    margin: EdgeInsets.all(15),
    alignment: Alignment.topCenter,
    child: Form(
      key: controller.CreateSylaubsFormKey1,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration:
                        fieldsForCreateSylabus.copyWith(labelText: 'اليوم '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'اسم السوره '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'رقم بداية الاية '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    // controller: controller
                    //     .UserNameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: fieldsForCreateSylabus.copyWith(
                        labelText: 'رقم نهاية الاية '),
                    // validator: (value) =>
                    //     controller
                    //         .ValidateUserNameFeild(
                    //             value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
