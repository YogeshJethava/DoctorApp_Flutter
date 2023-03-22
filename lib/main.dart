import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_practical/Routes/route_constants.dart';
import 'package:ui_practical/Routes/route_manager.dart';
import 'package:ui_practical/Theme/app_theme.dart';

void main() {
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstants.splashScreen,
      getPages: RouteManager.getRoutePages,
      theme: AppTheme.lightTheme(),
    );
  }
}

