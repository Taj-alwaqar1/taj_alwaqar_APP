// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/AppBar.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';

import 'package:frist_file_taj_alwaqar/view/Shared/SideBar.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Controller/Quran/screenViewQuranController.dart';
import '../../Model/Quran/Quran.dart';

class Quran extends StatelessWidget {
  Quran({super.key});

  @override
  Widget build(BuildContext context) {
    SurahBuilderController controller = Get.put(SurahBuilderController());
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CustomAppBar("المصحف"),
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.3849,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 50),
              itemCount: surahName.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    await controller.readJson();
                    await controller.getValue(index, controller.quran[0],
                        surahName[index]['name'], 0);
                    Get.to(() => SurahBuilder());
                  },
                  child: GridTile(
                      child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset("assets/img/Pasted_Graphic.png"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        surahName[index]['name'],
                        style:
                            TextStyle(fontSize: 21, color: yallowTextColor,fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                );
              }),
        ),
      ),
    );
  }
}

class SurahBuilder extends StatelessWidget {
  SurahBuilderController controller = Get.put(SurahBuilderController());
  @override
  Widget build(BuildContext context) {
    controller.LengthOfSura = noOfVerses[controller.sura.value];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.deletesurah();
              Get.off(() => Quran());
            },
            icon: Icon(
              Icons.arrow_back,
              color: goldenColor,
              size: 28,
            )),
        centerTitle: true,
        title: Text(
          // name of surah app
          controller.suraName.value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: yallowTextColor,
              fontFamily: 'quran',
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
        backgroundColor: greenColor,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: const Color.fromARGB(255, 253, 251, 240),
            child: Column(
              children: [
                (controller.sura == 0) || (controller.sura == 8)
                    ? const Text('')
                    : RetunBasmala(),
                verseBuilder(),
              ],
            )),
      ),
    );
  }
}

//ayah cdesign and will call repeative times
Row verseBuilder() {
  SurahBuilderController controller = Get.put(SurahBuilderController());
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 8),
              child: Text(
                //ayahh here
                controller.fullSura,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: controller.arabicFontSize,
                  fontFamily: controller.arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ],
        ),
      ),
    ],
  );
}

SafeArea SingleSuraBuilder() {
  SurahBuilderController controller = Get.put(SurahBuilderController());
  return SafeArea(
    child: Container(
      color: const Color.fromARGB(255, 253, 251, 240),
      child: ScrollablePositionedList.builder(
        itemCount: controller.LengthOfSura,
        itemBuilder: (BuildContext context, int index) {
          controller.indexxxx.value = index;
          return Column(
            children: [
              (index != 0) || (controller.sura == 0) || (controller.sura == 8)
                  ? const Text('')
                  : RetunBasmala(),
              Container(
                color: index % 2 != 0
                    ? const Color.fromARGB(255, 253, 251, 240)
                    : const Color.fromARGB(255, 253, 247, 230),
                child: verseBuilder(),
              ),
            ],
          );
        },
        itemScrollController: controller.itemScrollController,
        itemPositionsListener: controller.itemPositionsListener,
      ),
    ),
  );
}

class RetunBasmala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
