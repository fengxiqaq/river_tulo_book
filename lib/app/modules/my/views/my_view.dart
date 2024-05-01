import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/common.dart';
import 'package:river_tulo_book/app/common/database.dart';
import 'package:river_tulo_book/app/data/app_color.dart';
import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: const Text('我的'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => DangAnList());
                // list();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(),
                  ),
                ),
                child: ListTile(
                  title: Text("档案库", style: TextStyle(fontSize: 20.sp)),
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(),
                  ),
                ),
                child: ListTile(
                  title: Text("历史纪录", style: TextStyle(fontSize: 20.sp)),
                ),
              ),
            ),
            SizedBox(height: 250.h),
            Image.asset("assets/images/avatar.jpg", width: 100),
            SizedBox(height: 50.h),
            Text(
              '作者:FengXi',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'QQ:3226351770',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

}

class DangAnList extends GetView<MyController> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("档案库"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: "八字",
            ),
            Tab(
              text: "紫薇",
            ),
            Tab(
              text: "六爻",
            ),
          ]),
        ),
        body: GetBuilder<MyController>(builder: (controller) {
          return TabBarView(children: [
            ListView.separated(itemBuilder: (c, index) {
              return InkWell(
                onTap: () {
                  controller.add();
                },
                child: ListTile(
                  title: Text(controller.allItems[index].name),
                  subtitle: Text("备注:${controller.allItems[index].notes}"),
                ),
              );
            }, separatorBuilder: (c, index) {
              return const Divider();
            }, itemCount: controller.allItems.length),
            Center(
              child: Text("正在开发中。。。"),
            ),
            Center(
              child: Text("正在开发中。。。"),
            ),
          ],);
        }),
      ),
    );
  }

}
