// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';

const fieldsForInfovar = InputDecoration(
  labelStyle: TextStyle(
    color: yallowTextColor,
    fontSize: 24,
  ),
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yallowTextColor, width: 2),
  ),
  contentPadding: EdgeInsets.all(8),
);

const fieldsForInfovarHalaqh = InputDecoration(
  labelStyle: TextStyle(
    color: yallowTextColor,
    fontSize: 24,
  ),
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yallowTextColor, width: 2),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  contentPadding: EdgeInsets.all(10),
);

const fieldsForAccountUser = InputDecoration(
  labelStyle: TextStyle(
    color: yallowTextColor,
    fontSize: 18,
  ),
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yallowTextColor, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  contentPadding: EdgeInsets.all(8),
);

const fieldsForCreateSyllabus = InputDecoration(
  labelStyle: TextStyle(
    color: yallowTextColor,
    fontSize: 18,
  ),
  border: InputBorder.none,
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: yallowTextColor, width: 2),
  // ),
  contentPadding: EdgeInsets.all(4),
);
