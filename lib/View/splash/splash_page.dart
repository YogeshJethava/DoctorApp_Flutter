import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_practical/Controllers/splash/splash_controller.dart';
import 'package:ui_practical/Routes/route_constants.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  late ThemeData _themeData;
  late BuildContext _context;

  ///Create the instance of [SplashController] class.
  final SplashController _controller = Get.find(tag: RouteConstants.splashScreen);

  @override
  Widget build(BuildContext context) {
    _context = context;
    _themeData = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text('DoctorApp',style: _themeData.textTheme.headlineLarge),
      ),
    );
  }
}
