// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Shared/tabBarST.dart';

import 'package:provider/provider.dart';

import 'color.dart';

// ignore: must_be_immutable
class dropMenu extends StatefulWidget {
  const dropMenu({super.key});

  @override
  State<dropMenu> createState() => _dropMenuState();
}

class _dropMenuState extends State<dropMenu> {
  late String value;
  @override
  Widget build(BuildContext context) {
     value ="مستوى الطالب";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          iconSize: 35,
          iconEnabledColor: yallowTextColor,
          underline: Container(
            color: greenColor,
          ),
          dropdownColor: greenColor,
          value: value,
          isExpanded: true,
          hint:Text (value),
          onChanged: (String? newValue) {
            setState(() {
              value = newValue!;
            });
          },
          items: <String>[
           value,
            'مبتدئ',
            'متوسط',
            'عالي',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 24, color: yallowTextColor),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
