// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/LogIn&&SignIn/login.dart';
import 'package:provider/provider.dart';

import '../Shared/CustomTextFeild.dart';
import '../Shared/DropMenu.dart';
import '../Shared/color.dart';


import '../Shared/tabBarST.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final UserTypeIndex = Provider.of<UserType>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'تسجيل الدخول',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: [
                    Color.fromRGBO(164, 129, 17, 1),
                    Color.fromRGBO(232, 217, 152, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(Rect.fromLTWH(0.0, 70.0, 200.0, 58.0)),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StudentOrTeacher(),
              SizedBox(
                height: 20,
              ),
              fieldsForInfo(
                isPassword: false,
                labelTextfield: 'اسم المستخدم',
                typeOFtext: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              fieldsForInfo(
                isPassword: false,
                labelTextfield: 'الاسم الأول',
                typeOFtext: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              fieldsForInfo(
                isPassword: false,
                labelTextfield: 'الاسم الاخير',
                typeOFtext: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              fieldsForInfo(
                isPassword: false,
                labelTextfield: 'العمر',
                typeOFtext: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              fieldsForInfo(
                isPassword: false,
                labelTextfield: 'رقم الجوال',
                typeOFtext: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              if (UserTypeIndex.indexOfTabBar == 0)
                Column(
                  children: [
                    dropMenu(),
                    SizedBox(height: 20),
                  ],
                ),
              fieldsForInfo(
                isPassword: false,
                labelTextfield: 'البريد الإلكتروني',
                typeOFtext: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              fieldsForInfo(
                isPassword: true,
                labelTextfield: 'كلمة المرور',
                typeOFtext: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(164, 129, 17, 1)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 90, vertical: 0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
                ),
                child: Text(
                  "تسجيل ",
                  style: TextStyle(
                      fontSize: 37,
                      color: Color.fromRGBO(236, 231, 180, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
