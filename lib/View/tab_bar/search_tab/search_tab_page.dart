import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_practical/Constants/color_constants.dart';
import 'package:ui_practical/Constants/image_constants.dart';
import 'package:ui_practical/Controllers/tab_bar/search/search_tab_controller.dart';
import 'package:ui_practical/Routes/route_constants.dart';
import 'package:ui_practical/View/tab_bar/search_tab/category_widget.dart';
import 'package:ui_practical/View/tab_bar/search_tab/consultation_schedule_widget.dart';
import 'package:ui_practical/View/tab_bar/search_tab/recommended_doctor_widget.dart';
import 'package:ui_practical/custom_widget/textfield.dart';

class SearchTabPage extends StatelessWidget {
  SearchTabPage({Key? key}) : super(key: key);

  ///Create the instance of [SearchTabController] class.
  final SearchTabController _controller =
      Get.find(tag: RouteConstants.searchTab);

  late ThemeData _themeData;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    _context = context;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        leading: buildProfilePic(),
        actions: [buildNotificationIcon()],
      ),
      body: buildBody(),
    );
  }

  Stack buildBody() {
    return Stack(
      children: [
        Column(
          children: [buildHeaderMessage(), Expanded(child: buildContainer())],
        ),
        buildSearchTextField(),
      ],
    );
  }

  Container buildContainer() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        tileMode: TileMode.decal,
        stops: [0.2, 20],
        colors: [
          Colors.blueGrey.withOpacity(0.3),
          Colors.orange.withOpacity(0.0),
        ],
      )),
      child: ListView(
        children: [
          const SizedBox(
            height: 34,
          ),
          CategoryWidget(),
          RecommendedDoctorWidget(),
          const SizedBox(
            height: 20,
          ),
          ConsultationScheduleWidget()
        ],
      ),
    );
  }

  Positioned buildSearchTextField() {
    return const Positioned(
        top: 85,
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DoctorTextField(
            hint: 'Search Doctor or Sympton',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.sort_by_alpha_outlined),
          ),
        ));
  }

  Widget buildNotificationIcon() {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_sharp,
              size: 30,
            )),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            width: 16,
            height: 16,
            padding: const EdgeInsets.all(2),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.orange),
            ),
          ),
        )
      ],
    );
  }

  Container buildProfilePic() {
    return Container(
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.hardEdge,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          ImageConstants.profile,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildHeaderMessage() {
    return Container(
      height: 115,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      color: ColorConstants.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Good Morning and stay healthy',
              style: _themeData.textTheme.bodySmall!.merge(const TextStyle(
                  color: ColorConstants.whiteColor,
                  fontWeight: FontWeight.normal))),
          const SizedBox(
            height: 4,
          ),
          Text('Hi Jeny how are you?',
              style: _themeData.textTheme.headlineSmall!.merge(const TextStyle(
                  color: ColorConstants.whiteColor,
                  fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

}
