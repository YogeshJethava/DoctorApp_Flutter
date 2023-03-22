import 'dart:async';

import 'package:get/get.dart';
import 'package:ui_practical/Routes/route_constants.dart';
import 'package:ui_practical/View/tab_bar/tab_bar_page.dart';
class SplashController extends  GetxController{
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTime();
  }

  ///Start timer for delay screen navigation.
  startTime([int duration = 3])async{
     var time  = Duration(seconds: duration);
     return Timer(time,navigationPage);
  }

  ///Navigate to [TabBarPage].
  void navigationPage(){
    Get.offAllNamed(RouteConstants.tabBar);
  }
}