import 'package:get/get.dart';
import 'package:ui_practical/Controllers/tab_bar/search/search_tab_controller.dart';
import 'package:ui_practical/Routes/route_constants.dart';

class SearchTabBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchTabController(),tag: RouteConstants.searchTab);
  }

}