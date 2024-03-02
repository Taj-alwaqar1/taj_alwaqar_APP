import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetUserData/getMessage.dart';
import '../../view/Pages/chatscreen.dart';

class MessageController extends GetxController {
   RxString Name = "".obs;
   RxString specificuseremail = "".obs;
  final GetUsername = Get.put(GetMessageInfo());
  RxList<String> get userName => GetUsername.userName.value;



  RxList<String> get userEmail => GetUsername.userEmail.value;


  @override
  void onInit() async {
   await callermethode();
    

    super.onInit();
  }
  callermethode()async{
    GetUsername.getUserNames();
    GetUsername.getUseremail();

  }
  

  void navigateToTeacherDetail(String Username, String email) {
    Name.value = Username;
    specificuseremail.value=email;
    update();
    Get.to(()=>ChatScreen());

  }
}
