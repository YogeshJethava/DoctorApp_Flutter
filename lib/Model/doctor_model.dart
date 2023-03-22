import 'package:get/get.dart';

class DoctorModel{
  final String name;
  final String degree;
  final String image;
  RxBool isFav = false.obs;

  DoctorModel({required this.name,required this.degree,required this.image});
}