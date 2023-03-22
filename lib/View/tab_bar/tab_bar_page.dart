
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_practical/Constants/color_constants.dart';
import 'package:ui_practical/Controllers/tab_bar/tab_bar_controller.dart';
import 'package:ui_practical/Routes/route_constants.dart';
import 'package:ui_practical/View/tab_bar/search_tab/search_tab_page.dart';


class TabBarPage extends StatelessWidget {
  TabBarPage({Key? key}) : super(key: key);

  final TabBarController _controller = Get.find(tag: RouteConstants.tabBar);
  final listOfScreen = [
    Container(),
    Container(),
    SearchTabPage(),
    Container(),
    Container()
  ];

  RxList<Icon> tabList = [
    Icon(Icons.home_outlined, size: 30,color: Colors.black,),
    Icon(Icons.line_axis_outlined, size: 30,color: Colors.white,),
    Icon(Icons.search, size: 30,color: Colors.white),
    Icon(Icons.chat_bubble_outline, size: 30,color: Colors.white),
    Icon(Icons.person_outlined, size: 30,color: Colors.white),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        key: _controller.bottomNavigationKey,
        backgroundColor: Colors.transparent,
        items:  tabList,
        onTap: (index) {
          //Handle button tap
           for(int i=0; i<tabList.length; i++){
             final color = i == index ? Colors.black : Colors.white;
             final icon = Icon(tabList[i].icon, size: 30,color: color,);
             tabList[i] = icon;
           }
          _controller.selectedTab.value = index;
        },
        color: ColorConstants.primaryColor,
        buttonBackgroundColor: ColorConstants.whiteColor,
      ),
      body: listOfScreen[_controller.selectedTab.value],
    ));
  }
}
