// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/material.dart';
import '../Shared/ItemHomeTec.dart';
import '../Shared/SideBar.dart';
import '../Shared/color.dart';
import 'AppBar.dart';

class CreateHalaqh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: CustomAppBar("انشاء حلقة"),
          backgroundColor: darkGreen,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.account_circle_rounded,
                  size: 40, color: goldenColor),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              icon: const Icon(
                Icons.search,
                color: goldenColor,
                size: 40,
              ),
            ),
          ],
        ),
        drawer: SideBar(),
        body: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(60, 95, 64, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: ListView(
              children: [
                Column(
                  children: [
                    InputField(label: "اسم المسجد"),
                    const SizedBox(height: 10),
                    InputField(label: "اسم الحلقة"),
                    const SizedBox(height: 10),
                    InputField(label: "اسم المدرس"),
                    const SizedBox(height: 10),
                    InputField(label: "ايام الحلقة"),
                    const SizedBox(height: 10),
                    InputField(label: "وقت الحلقة"),
                    const SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                      child: Container(
                        child: Text(
                          'موقع الحلقة',
                          style: TextStyle(
                              color: Color.fromRGBO(232, 217, 152, 1),
                              fontSize: 30),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(darkGreen),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      child: Container(
                        child: Text(
                          'انشاء منهج',
                          style: TextStyle(
                              color: Color.fromRGBO(232, 217, 152, 1),
                              fontSize: 30),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(darkGreen),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                        textColor: Colors.red,
                        color: Colors.black,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "المنهج",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Container(
                                    color: Colors.white,
                                    width: 400,
                                    height: 500,
                                    child: Column(children: [
                                      Container(
                                        width: 200,
                                        height: 150,
                                        color: Color.fromRGBO(164, 129, 17, 1),
                                        margin: EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("الاحد",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                          Text("سورة : الحج",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                          Text("من ١ الى ١٥",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        height: 150,
                                        color: Color.fromRGBO(164, 129, 17, 1),
                                        margin: EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "الاثنين",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white),
                                          ),
                                          Text("سورة : الحج",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                          Text("من ١٥ الى ٣٠",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                        ]),
                                      ),
                                      TextButton(
                                        child: Container(
                                          child: Text(
                                            'اضافة',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    232, 217, 152, 1),
                                                fontSize: 30),
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromRGBO(
                                                      60, 95, 64, 1)),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ]),
                                  ),
                                );
                              });
                        })
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;

  const InputField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Color.fromRGBO(232, 217, 152, 1), fontSize: 30)),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(16, 68, 41, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
