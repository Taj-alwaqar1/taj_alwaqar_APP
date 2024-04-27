import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class bottomNavnController extends GetxController{
    PageController pageControllerindex = PageController(initialPage: 2);

  RxInt currentpage = 2.obs;
  
    @override
  void dispose() {
    pageControllerindex.dispose();
    super.dispose();
  }
changepageindex(index){
  currentpage.value=index;

}
}