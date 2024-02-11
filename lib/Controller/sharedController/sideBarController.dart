import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

class sideBarController extends GetxController{
  
  
  signOut()async{
    await FirebaseAuth.instance.signOut();
   Get.offAll(() => Login());
  }
}