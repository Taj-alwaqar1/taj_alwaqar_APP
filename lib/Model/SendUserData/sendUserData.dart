import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SendUserData extends GetxController{


   CollectionReference users = FirebaseFirestore.instance.collection('users');

   
   adduser(  
    String username,
    String fristname,
    String lastname,
    String age,
    String phonenumber,
    String levelstd,
    String email,
    String password,)async{
    // if(formState.currentState!.validate()){} in controller 
 await users.add({
   "username" :username,
   "fristname" :fristname,
   "lastname" :lastname,
   "age" :age,
   "phonenumber" :phonenumber,
   "levelstd" :levelstd.hashCode,
   "email" :email,
   "password" :password,
 });
   }
}