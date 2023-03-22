import 'package:get/get.dart';

class CategoryModel{
  final String icon;
  final String name;
  RxBool isSelect = false.obs;

  CategoryModel({
    required this.icon,required this.name});
}