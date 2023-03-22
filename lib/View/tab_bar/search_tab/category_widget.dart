import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/color_constants.dart';
import '../../../Controllers/tab_bar/search/search_tab_controller.dart';
import '../../../Routes/route_constants.dart';
import 'package:ui_practical/Model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  ///Create the instance of [SearchTabController] class.
  final SearchTabController _controller =
      Get.find(tag: RouteConstants.searchTab);

  late ThemeData _themeData;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _context = context;
    return buildCategory();
  }

  ///build the [buildCategory] widget.
  Widget buildCategory() {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategoryHeading(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: Obx(
            () => buildGridView(),
          ))
        ],
      ),
    );
  }

  ///build the [buildGridView] widget.
  GridView buildGridView() {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1),
      itemBuilder: (itemBuilder, index) {
        final obj = _controller.vm.categoryList[index];
        return Obx(() => InkWell(
              onTap: () {
                _controller.vm.selectCategory(index);
              },
              child: buildGridItem(obj),
            ));
      },
      itemCount: _controller.vm.categoryList.length,
    );
  }

  ///build the [buildGridItem] widget.
  Column buildGridItem(CategoryModel obj) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color:
                obj.isSelect.value ? ColorConstants.primaryColor : Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(12),
          width: 44,
          height: 44,
          child: Image.asset(
            obj.icon,
            color: Colors.redAccent,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(obj.name)
      ],
    );
  }

  ///build the [buildCategoryHeading] widget.
  Padding buildCategoryHeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        'Category',
        style: _themeData.textTheme.bodyMedium!
            .merge(const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
