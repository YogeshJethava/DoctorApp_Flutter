import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/color_constants.dart';
import '../../../Controllers/tab_bar/search/search_tab_controller.dart';
import '../../../Routes/route_constants.dart';
import 'package:ui_practical/Model/doctor_model.dart';

class RecommendedDoctorWidget extends StatelessWidget {
  RecommendedDoctorWidget({Key? key}) : super(key: key);

  ///Create the instance of [SearchTabController] class.
  final SearchTabController _controller =
      Get.find(tag: RouteConstants.searchTab);

  late ThemeData _themeData;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _context = context;
    return buildRecommendedDoctor();
  }

  ///build the [buildRecommendedDoctor] widget.
  Widget buildRecommendedDoctor() {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRecommendedTitle(),
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
      padding: const EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 0,
          childAspectRatio: 1.3),
      itemBuilder: (itemBuilder, index) {
        final obj = _controller.vm.doctorList[index];
        return buildGridItem(obj);
      },
      itemCount: _controller.vm.doctorList.length,
    );
  }

  ///build the [buildRecommendedTitle] widget.
  Container buildGridItem(DoctorModel obj) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Flexible(
                  child: Image.asset(
                obj.image,
                fit: BoxFit.fill,
              )),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      obj.name,
                      style: _themeData.textTheme.bodyMedium!
                          .merge(TextStyle(color: Colors.blue)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      obj.degree,
                      style: _themeData.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          Positioned(
              right: 0,
              top: 0,
              width: 44,
              height: 44,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: ColorConstants.primaryColor,
                  )))
        ],
      ),
    );
  }

  ///build the [buildRecommendedTitle] widget.
  Padding buildRecommendedTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recommended Doctor\'',
            style: _themeData.textTheme.bodyMedium!
                .merge(TextStyle(fontWeight: FontWeight.w600)),
          ),
          Text(
            'See All',
            style: _themeData.textTheme.bodyMedium!.merge(const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
