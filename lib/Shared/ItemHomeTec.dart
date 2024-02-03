// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/color.dart';
import 'package:frist_file_taj_alwaqar/pages/halaqh.dart';

class HomeTecItem extends StatelessWidget {
  String halaqhName, stdName;
  HomeTecItem({super.key, required this.halaqhName, required this.stdName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "حلقة : $halaqhName",
            style: TextStyle(
              color: yallowTextColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenColor,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ItemHalaqh(stdName: 's'),
                    ItemHalaqh(stdName: 's'),
                    ItemHalaqh(stdName: 's'),
                    ItemHalaqh(stdName: 's'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemHalaqh extends StatelessWidget {
  String stdName;
  ItemHalaqh({super.key,  required this.stdName}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: darkGreen,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: greenColor,
                ),
                child:  Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: goldenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text(
                stdName,
                style: TextStyle(
                  color: yallowTextColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.check_circle,
            color: goldenColor,
            size: 26,
          ),
        ],
      ),
    );
  }
}
