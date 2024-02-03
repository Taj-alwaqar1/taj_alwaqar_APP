// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/SideBar.dart';
import 'package:frist_file_taj_alwaqar/Shared/appBar.dart';
import 'package:frist_file_taj_alwaqar/Shared/color.dart';

class SurahName {
  String surahname;
  SurahName({required this.surahname});
}

class Quran extends StatelessWidget {
  List surahName = [
    SurahName(surahname: "الفاتحة"),
    SurahName(surahname: "البقرة"),
    SurahName(surahname: "ال عمران"),
    SurahName(surahname: "النساء"),
    SurahName(surahname: "المَائدة"),
    SurahName(surahname: "الأنعَام"),
    SurahName(surahname: "الأعرَاف"),
    SurahName(surahname: "الأنفَال"),
    SurahName(surahname: "التوبَة"),
    SurahName(surahname: "يُونس"),
    SurahName(surahname: "هُود"),
    SurahName(surahname: "يُوسُف"),
    SurahName(surahname: "الرَّعْد"),
  ];

  Quran({super.key});

  @override
  Widget build(BuildContext context) {
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
                  childAspectRatio: 1 / 1.39,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 50),
              itemCount: surahName.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
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
                      Text(surahName[index].surahname,style: TextStyle(fontSize: 21,color: yallowTextColor),),
                    ],
                  )),
                );
              }),
        ),
      ),
    );
  }
}
