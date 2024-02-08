// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 

class searchPage extends StatelessWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: goldenColor,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
        backgroundColor: darkGreen,
        title: CupertinoSearchTextField(
          prefixInsets: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: goldenColor, width: 1),
          ),
          prefixIcon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: goldenColor,
                border: Border.all(
                  color: goldenColor,
                ),
              ),
              child: Icon(
                CupertinoIcons.search,
                color: greenColor,
                size: 30,
              )),
        ),
      ),
    );
  }
}
