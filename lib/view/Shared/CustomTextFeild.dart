// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
 

class fieldsForInfo extends StatelessWidget {
  String labelTextfield ;
  bool isPassword;
  TextInputType typeOFtext;
 fieldsForInfo({super.key, required this.labelTextfield, required this.isPassword,required this.typeOFtext});
 

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(10),
            //  border: Border.all(color: yallowTextColor,width: 2)
          ),
          child: TextField(
            
            keyboardType: typeOFtext,
            textInputAction: TextInputAction.next,
            obscureText:isPassword ,
            decoration: InputDecoration(
              labelText: labelTextfield,
              labelStyle: TextStyle(
                color: yallowTextColor,
                fontSize: 24,
              ),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: yallowTextColor, width: 2),
              ),
              contentPadding: EdgeInsets.all(8),
            ),
          ),
        ),
      ),
    );
  }
}

