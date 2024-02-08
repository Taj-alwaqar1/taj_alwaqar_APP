import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticateSignin extends GetxController{
// static AuthenticateSignin get instance =>Get.find();  

//   final _auth =FirebaseAuth.instance;
//   late final Rx<User?>firebaseUser;

//     @override
//     void onReady(){
//       firebaseUser=Rx<User?>(_auth.currentUser);
//       firebaseUser.bindStream(_auth.userChanges());
//       // ever(firebaseUser, registerOrNot);
//     }

  // registerOrNot(User?user){
  //   user==null? Get.offAll(Login()):Get.offAll(Home());
  // }
 registerUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("object");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

}