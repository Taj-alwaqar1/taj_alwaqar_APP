import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_file_taj_alwaqar/view/Login&&Signin/LogIn.dart';
import 'package:get/get.dart';

import '../../Model/GetStudentData/getStudentData.dart';



class sideBarController extends GetxController{
    
   final getStudentsData getStudentsDataModel =
      Get.put(getStudentsData());
    
  
 
    String get username{
      getStudentsDataModel.GetStdData();
      update();
      return getStudentsDataModel.GetStdName;
    }


  signOut()async{
    await FirebaseAuth.instance.signOut();
   Get.offAll(() => Login());
  }
}