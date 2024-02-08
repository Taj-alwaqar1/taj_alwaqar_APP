// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/SignIn.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CustomTextFeild.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Directionality(
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovar.copyWith(
                            labelText: "الإسم او البريد الإلكتروني"),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(
                  height: 30,
                ),

                Directionality(
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration:
                            fieldsForInfovar.copyWith(labelText: "كلمة المرور"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => userScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(goldenColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 90, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                  ),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                        fontSize: 37,
                        color: yallowTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "ليس لديك حساب؟",
                      style: TextStyle(
                        fontSize: 33,
                        color: yallowTextColor,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
