import 'package:get/get.dart';
import 'package:ui_practical/Constants/image_constants.dart';
import 'package:ui_practical/Constants/string_constants.dart';
import 'package:ui_practical/Model/doctor_model.dart';

import '../../Model/category_model.dart';

class SearchTabViewModel {

  ///Private properties
  final RxList<CategoryModel> _categoryList = RxList.empty(growable: true);
  final RxList<DoctorModel> _doctorList = RxList.empty(growable: true);
  final RxList<DoctorModel> _consultationList = RxList.empty(growable: true);

  ///Get-Only properties
  RxList<CategoryModel> get categoryList => _categoryList;
  RxList<DoctorModel> get doctorList => _doctorList;
  RxList<DoctorModel> get consultationList => _doctorList;

  ///Insert the data into the [categoryList] array.
  void createCategoryEntry() {
    final dental =
        CategoryModel(icon: ImageConstants.tooth, name: StringConstants.dental);
    final heart = CategoryModel(
        icon: ImageConstants.heartBeat, name: StringConstants.heart);
    final eyes =
        CategoryModel(icon: ImageConstants.eye, name: StringConstants.eyes);
    final brain =
        CategoryModel(icon: ImageConstants.brain, name: StringConstants.brain);
    final brain2 =
        CategoryModel(icon: ImageConstants.brain, name: StringConstants.brain);

    _categoryList.value = [dental, heart, eyes, brain, brain2];
  }

  ///Selected Category while user tap the category
  void selectCategory(int index) {
    int i = 0;
    for (var element in _categoryList) {
      element.isSelect.value = (i == index);
      i += 1;
    }
  }

  ///Insert the data into the [doctorList] array.
  void createDoctorEntry() {
    final doctor1 = DoctorModel(
        name: "Dr. Amelia Daniel",
        degree: "Dermatologist",
        image: ImageConstants.doctor);
    final doctor2 = DoctorModel(
        name: "Dr. Amelia Daniel",
        degree: "Dermatologist",
        image: ImageConstants.doctor);
    final doctor3 = DoctorModel(
        name: "Dr. Amelia Daniel",
        degree: "Dermatologist",
        image: ImageConstants.doctor);
    _doctorList.value = [doctor1, doctor2, doctor3];
  }

  ///Insert the data into the [consultationList] array.
  void createConsultationEntry() {
    final doctor1 = DoctorModel(
        name: "Dr. Amelia Daniel",
        degree: "Dermatologist",
        image: ImageConstants.doctor);
    final doctor2 = DoctorModel(
        name: "Dr. Amelia Daniel",
        degree: "Dermatologist",
        image: ImageConstants.doctor);
    final doctor3 = DoctorModel(
        name: "Dr. Amelia Daniel",
        degree: "Dermatologist",
        image: ImageConstants.doctor);
    _consultationList.value = [doctor1, doctor2, doctor3];
  }
}
