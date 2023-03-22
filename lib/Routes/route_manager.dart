import 'package:get/get.dart';
import 'package:ui_practical/Controllers/splash/splash_binding.dart';
import 'package:ui_practical/Controllers/tab_bar/search/doctor_detail/doctor_detail_binding.dart';
import 'package:ui_practical/Controllers/tab_bar/search/search_tab_binding.dart';
import 'package:ui_practical/Controllers/tab_bar/tab_bar_binding.dart';
import 'package:ui_practical/Routes/route_constants.dart';
import 'package:ui_practical/View/splash/splash_page.dart';
import 'package:ui_practical/View/tab_bar/tab_bar_page.dart';

import '../View/tab_bar/search_tab/doctor_detail/doctor_detail_page.dart';
import '../View/tab_bar/search_tab/search_tab_page.dart';

abstract class RouteManager{
  static List<GetPage<dynamic>> get getRoutePages =>[
    GetPage(name: RouteConstants.splashScreen, page: ()=> SplashPage(),binding: SplashBinding()),
    GetPage(name: RouteConstants.tabBar, page: ()=> TabBarPage(),binding: TabBarBinding()),
    GetPage(name: RouteConstants.searchTab, page: ()=> SearchTabPage(),binding: SearchTabBinding()),
    GetPage(name: RouteConstants.doctorDetailScreen, page: ()=> DoctorDetailPage(),binding: DoctorDetailBinding()),
  ];
}