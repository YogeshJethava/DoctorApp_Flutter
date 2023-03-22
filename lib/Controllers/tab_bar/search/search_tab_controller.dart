import 'package:get/get.dart';
import 'package:ui_practical/ViewModel/search_tab/search_tab_view_model.dart';

class SearchTabController extends GetxController{

  ///Create the instance of [SearchTabViewModel] class.
  final SearchTabViewModel vm = SearchTabViewModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    vm.createCategoryEntry();
    vm.createDoctorEntry();
    vm.createConsultationEntry();
  }
}