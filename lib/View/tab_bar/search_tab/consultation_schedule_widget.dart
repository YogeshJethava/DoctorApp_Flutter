import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/tab_bar/search/search_tab_controller.dart';
import '../../../Routes/route_constants.dart';
import 'package:ui_practical/Model/doctor_model.dart';

class ConsultationScheduleWidget extends StatelessWidget {
  ConsultationScheduleWidget({Key? key}) : super(key: key);

  ///Create the instance of [SearchTabController] class.
  final SearchTabController _controller =
      Get.find(tag: RouteConstants.searchTab);

  late ThemeData _themeData;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _context = context;
    return buildConsultationSchedule();
  }

  ///build the [buildConsultationSchedule] widget.
  Widget buildConsultationSchedule() {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildConsultationTitle(),
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 0,
          mainAxisExtent: (Get.size.width - 32)),
      itemBuilder: (itemBuilder, index) {
        final obj = _controller.vm.consultationList[index];
        return buildGridItem(obj);
      },
      itemCount: _controller.vm.consultationList.length,
    );
  }

  ///build the [buildGridItem] widget.
  Container buildGridItem(DoctorModel obj) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Image.asset(
            obj.image,
            fit: BoxFit.cover,
            width: 44,
            height: 44,
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
                  style: _themeData.textTheme.titleMedium!
                      .merge(const TextStyle(fontWeight: FontWeight.w600)),
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
    );
  }

  ///build the [buildConsultationTitle] widget.
  Padding buildConsultationTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Consultation Schedule',
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
