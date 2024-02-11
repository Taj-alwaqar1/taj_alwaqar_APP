
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController with GetTickerProviderStateMixin {
   late TabController tabController ; 

   RxInt indexOfTabBar=0.obs;
   @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
 
  tabControllerChange(index) {
    indexOfTabBar.value = index;
  }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  } 
}