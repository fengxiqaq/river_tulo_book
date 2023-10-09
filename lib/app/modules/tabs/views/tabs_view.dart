import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/app_color.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            controller.pageController.animateToPage(
                index, duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutQuart);
            controller.currentIndex.value = index;
          },
          indicatorColor: const Color(0xffb2955d),
          selectedIndex: controller.currentIndex.value,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.explore, color: AppColors.golden),
              selectedIcon: Icon(Icons.explore, color: AppColors.colorPrimary),
              label: '排盘',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_rounded, color: AppColors.golden),
              selectedIcon: Icon(
                  Icons.menu_book_rounded, color: AppColors.colorPrimary),
              label: '书房',
            ),
            NavigationDestination(
              icon: Icon(Icons.school, color: AppColors.golden),
              selectedIcon: Icon(Icons.school, color: AppColors.colorPrimary),
              label: '研习',
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: AppColors.golden),
              selectedIcon: Icon(Icons.person, color: AppColors.colorPrimary),
              label: '我的',
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: AppColors.golden,
        //   child: Text(
        //       "讨论", style: TextStyle(color: Colors.black, fontSize: 16)),
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(50))),
        // ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            controller.currentIndex.value = index;
          },
          children: controller.pages,
        ),
      );
    });
  }
}
