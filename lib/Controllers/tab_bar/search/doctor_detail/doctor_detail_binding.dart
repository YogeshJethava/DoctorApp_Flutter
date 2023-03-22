import 'package:get/get.dart';
import 'package:ui_practical/Controllers/tab_bar/search/doctor_detail/doctor_detail_controller.dart';
import 'package:ui_practical/Routes/route_constants.dart';

class DoctorDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DoctorDetailController(),tag: RouteConstants.doctorDetailScreen);
  }

}