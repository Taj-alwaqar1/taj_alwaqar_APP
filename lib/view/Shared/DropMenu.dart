// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/SigninController.dart';
import 'package:frist_file_taj_alwaqar/Controller/sharedController/dropmenuController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';

 
class dropMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DropMenuController controllerDropMenu = Get.put(DropMenuController());
 
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
            onChanged: (String? newValue)  {
               controllerDropMenu.changeinitvalue(newValue);
              // [controllerSignin.getlevelStd(newValue)];
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

// void HalaqhDropMenu(BuildContext context) {
//  }
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     child: Container(
//       decoration: BoxDecoration(
//         color: greenColor,
//         borderRadius: BorderRadius.circular(30),
//         //  border: Border.all(color: yallowTextColor,width: 2)
//       ),
//       child: TextFormField(
//         controller: controller.halaqhDaysController,
//         keyboardType: TextInputType.number,
//         textInputAction: TextInputAction.next,
//         obscureText: false,
//         decoration: fieldsForInfovarHalaqh.copyWith(
//             labelText: ' ايام الحلقة'),
//         onSaved: (value) {
//           controller.halaqhDaysController.text = value!;
//         },
//         validator: (value) {
//           // return controller.ValidateAgeFeild(value!);
//         },
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//       ),
//     ),
//   ),
// ),

class TimesHalaqhDropMenu extends dropMenu {
  final DropMenuController controllerDropMenu = Get.put(DropMenuController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(30),
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
              controllerDropMenu.changeinitvalue2(newValue);
              // controllerSignin.getlevelStd(newValue);
            },
            value: controllerDropMenu.initvalue2.value,
            hint: Text(controllerDropMenu.initvalue2.value),
            items: <String>[
              if (controllerDropMenu.initvalue2.value != 'العصر - المغرب' &&
                  controllerDropMenu.initvalue2.value !=
                     'العصر - العشاء' &&
                  controllerDropMenu.initvalue2.value != 'المغرب - العشاء')
                controllerDropMenu.initvalue2.value,
              'العصر - العشاء',
              'العصر - المغرب',
              'المغرب - العشاء',
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

class DaysHalaqhDropMenu extends dropMenu {
  final DropMenuController controllerDropMenu = Get.put(DropMenuController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(30),
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
              controllerDropMenu.changeinitvalue1(newValue);
              // controllerSignin.getlevelStd(newValue);
            },
            value: controllerDropMenu.initvalue1.value,
            hint: Text(controllerDropMenu.initvalue1.value),
            items: <String>[
              if (controllerDropMenu.initvalue1.value !=
                      'الاحد -  الثلاثاء - الخميس' &&
                  controllerDropMenu.initvalue1.value !=
                      'الاثنين  - الثلاثاء - الاربعاء' &&
                  controllerDropMenu.initvalue1.value !=
                      '  الاحد   -  الاثنين - الثلاثاء')
                controllerDropMenu.initvalue1.value,
              'الاحد -  الثلاثاء - الخميس',
              'الاثنين  - الثلاثاء - الاربعاء',
              '  الاحد   -  الاثنين - الثلاثاء',
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
