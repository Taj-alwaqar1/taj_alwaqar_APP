// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CustomTextFeild.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/DropMenu.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/tabBarST.dart';
import 'package:provider/provider.dart';
 

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
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovar.copyWith(
                        labelText: 'اسم المستخدم'),
                      ),
                    ),
                  ),
                ),

            
              SizedBox(
                height: 20,
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
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovar.copyWith(
                        labelText:'الاسم الأول'),
                      ),
                    ),
                  ),
                ),


              SizedBox(
                height: 20,
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
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovar.copyWith(
                        labelText:'الاسم الاخير'),
                      ),
                    ),
                  ),
                ),
              
              
              SizedBox(
                height: 20,
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovar.copyWith(
                        labelText:'العمر'),
                      ),
                    ),
                  ),
                ),
              
              SizedBox(
                height: 20,
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: fieldsForInfovar.copyWith(
                        labelText:'رقم الجوال'),
                      ),
                    ),
                  ),
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
                        labelText:'البريد الإلكتروني'),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 20,
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
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: fieldsForInfovar.copyWith(
                        labelText:'كلمة المرور'),
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
