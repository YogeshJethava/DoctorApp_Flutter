import 'package:get/get.dart';
import 'package:ui_practical/Controllers/splash/splash_controller.dart';
import 'package:ui_practical/Routes/route_constants.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController(),tag: RouteConstants.splashScreen);
  }

}