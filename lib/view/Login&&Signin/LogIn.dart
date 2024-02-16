// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/loginController.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/SignIn.dart';
import 'package:frist_file_taj_alwaqar/view/Screen/Screen.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/CustomTextFeild.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LogInController controller = Get.put(LogInController());
    return Container(
      decoration: BoxDecoration(
        gradient: GradientGreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
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
                        child: TextFormField(
                          controller: controller.EmailController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: fieldsForInfovar.copyWith(
                              labelText: "البريد الإلكتروني"),
                          onSaved: (value) {
                            controller.EmailController.text = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        child: GetBuilder<LogInController>(
                        builder: (controller) => TextFormField(
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: controller.isVisibile ? true : false,
                          decoration: fieldsForInfovar.copyWith(
                              labelText: 'كلمة المرور',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.Visibile();
                                  },
                                  icon: Icon(
                                    Icons.visibility,
                                    color: yallowTextColor,
                                  ))),
                          onSaved: (value) {
                            controller.passwordController.text = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<LogInController>(
                    builder: (controller) => ElevatedButton(
                      onPressed: () {
                        controller.checkLogIn();
                        controller.loading();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(goldenColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 90, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                      ),
                      child: controller.isLoading
                          ? CircularProgressIndicator(
                              color: greenColor,
                            )
                          : Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  fontSize: 37,
                                  color: yallowTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.off(() => SignIn());
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
      ),
    );
  }
}