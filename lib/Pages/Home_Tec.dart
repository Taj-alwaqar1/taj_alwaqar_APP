import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/appBar.dart';

import '../Shared/ItemHomeTec.dart';
import '../Shared/SideBar.dart';
import '../Shared/color.dart';

class HomePageTec extends StatefulWidget {
  const HomePageTec({super.key});

  @override
  State<HomePageTec> createState() => _HomePageTecState();
}

class _HomePageTecState extends State<HomePageTec> {
  @override
  Widget build(BuildContext context) {
      return Container(
         decoration: const BoxDecoration(
        gradient: GradientGreen,
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CustomAppBar("الطلاب"),
          backgroundColor: darkGreen,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.account_circle_rounded,
                  size: 40, color:goldenColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: SideBar(),
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeTecItem(halaqhName: 'عثمان بن عفان', stdName: 'محمد',),
            ],
          ),
        ),
            ),
      );
  }
}