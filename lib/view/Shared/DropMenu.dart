// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/SigninController.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/dropmenuController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class dropMenu extends StatelessWidget {
  final DropMenuController controllerDropMenu = Get.put(DropMenuController());
    final SigninController controllerSignin = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
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
        child: Obx(
          () => DropdownButton<String>(
            iconSize: 35,
            iconEnabledColor: yallowTextColor,
            underline: Container(
              color: greenColor,
            ),
            dropdownColor: greenColor,
            isExpanded: true,
            onChanged: (String? newValue) {
              controllerDropMenu.changeinitvalue(newValue);
               controllerSignin.getlevelStd(newValue);
            },
            value: controllerDropMenu.initvalue.value,
            hint: Text(controllerDropMenu.initvalue.value),
            items: <String>[
              if (controllerDropMenu.initvalue.value != 'مبتدئ' &&
                  controllerDropMenu.initvalue.value != 'متوسط' &&
                  controllerDropMenu.initvalue.value != 'عالي')
                controllerDropMenu.initvalue.value,
              'مبتدئ',
              'متوسط',
              'عالي',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style:
                        const TextStyle(fontSize: 24, color: yallowTextColor),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
