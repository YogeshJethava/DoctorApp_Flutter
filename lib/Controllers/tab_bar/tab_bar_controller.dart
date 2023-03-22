import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController{

  RxInt selectedTab = 0.obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}