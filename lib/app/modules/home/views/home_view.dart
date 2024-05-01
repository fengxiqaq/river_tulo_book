import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/common.dart';
import 'package:river_tulo_book/app/data/app_color.dart';
import 'package:river_tulo_book/app/modules/location/controllers/location_controller.dart';
import '../../location/views/location_view.dart';
import '../../tabs/controllers/tabs_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final locationController = Get.put(LocationController());
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        Text("河图洛书", style: TextStyle(fontSize: 25.sp)),
                        Expanded(child: GestureDetector(
                          onTap: () {
                            if(controller.pageController.page!.toInt() == 0){
                              controller.panType = 3;
                              controller.pageController.animateToPage(2, duration: const Duration(milliseconds: 200), curve: Curves.linear);
                            }
                            else {
                              controller.panType = 1;
                              controller.pageController.animateToPage(0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("切换", style: TextStyle(
                                  fontSize: 25.sp,
                                  color: AppColors.colorPrimary),
                                  textAlign: TextAlign.end),
                              SizedBox(width: 10.w),
                              Image.asset(
                                  "assets/icon/replace.png", height: 25.h),
                              SizedBox(width: 5.w),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    // width: double.infinity,
                    height: 400.h,
                    child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          // width: double.infinity,
                          height: 400.h,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Text('盘主：', style: TextStyle(fontSize: 25.sp)),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                        controller: controller.name,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "请输入姓名",
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 25.sp,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.golden,
                                          fontSize: 25.sp,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                controller
                                                    .onSwitchSexValueChanged(),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: controller
                                                      .switchSexValue
                                                      .value ? Border.all(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    width: 2.w,
                                                  ) : null,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                    "乾", style: TextStyle(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    fontSize: 25.sp))
                                            ),
                                          ),
                                          Text("?", style: TextStyle(
                                              color: AppColors.colorPrimary,
                                              fontSize: 25.sp)),
                                          InkWell(
                                            onTap: () =>
                                                controller
                                                    .onSwitchSexValueChanged(),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: controller
                                                      .switchSexValue
                                                      .value ? null : Border
                                                      .all(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    width: 2.w,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                    "坤", style: TextStyle(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    fontSize: 25.sp))
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              SizedBox(height: 20.h),
                              InkWell(
                                onTap: () {
                                  controller.showDatePicker(context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.dateTimeString.value,
                                      style: TextStyle(fontSize: 20.sp,
                                          color: AppColors.golden),
                                    ),
                                    SizedBox(height: 10.h),
                                    const Divider(
                                        height: 1, color: Colors.black26),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              InkWell(
                                onTap: () {
                                  locationController.country.clear();
                                  locationController.state.clear();
                                  locationController.city.clear();
                                  Get.dialog(
                                      Dialog(backgroundColor: Colors.white12,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))
                                          ),
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                              vertical: 100.h),
                                          child: const LocationView()),
                                      barrierColor: Colors.black26
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(locationController.countryValue
                                        .isEmpty ||
                                        locationController.countryValue == ""
                                        ? "未知地区-北京"
                                        : "${locationController
                                        .countryValue} ${locationController
                                        .stateValue} ${locationController
                                        .cityValue}",
                                        style: TextStyle(fontSize: 20.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.golden),
                                        maxLines: 1),
                                    SizedBox(height: 10.h),
                                    const Divider(
                                        height: 1, color: Colors.black26),
                                  ],
                                ),
                              ),
                              SizedBox(height: 45.h),
                              Text("时区: ${controller.timeZone}",
                                  style: TextStyle(fontSize: 16.sp)),
                              Text("真太阳时：${controller.solarTime}",
                                  style: TextStyle(fontSize: 16.sp)),
                              Text("地址经纬: ${controller.longitude} ${controller
                                  .latitude}",
                                  style: TextStyle(fontSize: 16.sp)),
                              Row(children: [
                                Text("备注:", style: TextStyle(fontSize: 16.sp)),
                                Expanded(
                                  child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "陌生人",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.golden,
                                        fontSize: 14.sp,
                                      )
                                  ),
                                ),
                              ]),
                              Row(
                                children: [
                                  Text("保存此盘",
                                      style: TextStyle(fontSize: 16.sp)),
                                  Obx(() =>
                                      Center(
                                        child: Transform.scale(
                                          scale: 0.5.w,
                                          child: Switch(
                                            value: controller.switchValue.value,
                                            onChanged: controller
                                                .onSwitchValueChanged,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: double.infinity,
                          height: 400.h,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Text('紫薇盘主：', style: TextStyle(fontSize: 25.sp)),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                        controller: controller.name,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "请输入姓名",
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 25.sp,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.golden,
                                          fontSize: 25.sp,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                controller
                                                    .onSwitchSexValueChanged(),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: controller
                                                      .switchSexValue
                                                      .value ? Border.all(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    width: 2.w,
                                                  ) : null,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                    "乾", style: TextStyle(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    fontSize: 25.sp))
                                            ),
                                          ),
                                          Text("?", style: TextStyle(
                                              color: AppColors.colorPrimary,
                                              fontSize: 25.sp)),
                                          InkWell(
                                            onTap: () =>
                                                controller
                                                    .onSwitchSexValueChanged(),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: controller
                                                      .switchSexValue
                                                      .value ? null : Border
                                                      .all(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    width: 2.w,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                    "坤", style: TextStyle(
                                                    color: AppColors
                                                        .colorPrimary,
                                                    fontSize: 25.sp))
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              SizedBox(height: 20.h),
                              InkWell(
                                onTap: () {
                                  controller.showDatePicker(context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.dateTimeString.value,
                                      style: TextStyle(fontSize: 20.sp,
                                          color: AppColors.golden),
                                    ),
                                    SizedBox(height: 10.h),
                                    const Divider(
                                        height: 1, color: Colors.black26),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              InkWell(
                                onTap: () {
                                  locationController.country.clear();
                                  locationController.state.clear();
                                  locationController.city.clear();
                                  Get.dialog(
                                      Dialog(backgroundColor: Colors.white12,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))
                                          ),
                                          insetPadding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                              vertical: 100.h),
                                          child: const LocationView()),
                                      barrierColor: Colors.black26
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(locationController.countryValue
                                        .isEmpty ||
                                        locationController.countryValue == ""
                                        ? "未知地区-北京"
                                        : "${locationController
                                        .countryValue} ${locationController
                                        .stateValue} ${locationController
                                        .cityValue}",
                                        style: TextStyle(fontSize: 20.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.golden),
                                        maxLines: 1),
                                    SizedBox(height: 10.h),
                                    const Divider(
                                        height: 1, color: Colors.black26),
                                  ],
                                ),
                              ),
                              SizedBox(height: 45.h),
                              Text("时区: ${controller.timeZone}",
                                  style: TextStyle(fontSize: 16.sp)),
                              Text("真太阳时：${controller.solarTime}",
                                  style: TextStyle(fontSize: 16.sp)),
                              Text("地址经纬: ${controller.longitude} ${controller
                                  .latitude}",
                                  style: TextStyle(fontSize: 16.sp)),
                              Row(children: [
                                Text("备注:", style: TextStyle(fontSize: 16.sp)),
                                Expanded(
                                  child: TextField(
                                      controller: controller.notes,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "陌生人",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                      style: TextStyle(
                                        color: AppColors.golden,
                                        fontSize: 14.sp,
                                      )
                                  ),
                                ),
                              ]),
                              Row(
                                children: [
                                  Text("保存此盘",
                                      style: TextStyle(fontSize: 16.sp)),
                                  Obx(() =>
                                      Center(
                                        child: Transform.scale(
                                          scale: 0.5.w,
                                          child: Switch(
                                            value: controller.switchValue.value,
                                            onChanged: controller
                                                .onSwitchValueChanged,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: double.infinity,
                          height: 400.h,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
                                Text('六爻：', style: TextStyle(fontSize: 25.sp)),
                                // GestureDetector(onTap: (){
                                //
                                // },child: Icon(Icons.refresh,color: AppColors.colorPrimary,size: 30.w)),
                              ]),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextField(
                                        controller: controller.name,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "请输入所占之事",
                                          hintStyle: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 25.sp,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.golden,
                                          fontSize: 25.sp,
                                        )
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          Text("第",
                                              style: TextStyle(
                                                  color: AppColors.colorPrimary,
                                                  fontSize: 25.sp)),
                                          Container(
                                              decoration: BoxDecoration(
                                                border: controller
                                                    .switchSexValue
                                                    .value ? Border.all(
                                                  color: AppColors
                                                      .colorPrimary,
                                                  width: 2.w,
                                                ) : null,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                  "${controller.globalKey
                                                      .currentState == null ? controller
                                                      .NUMBERS[0] : controller
                                                      .NUMBERS[controller.globalKey
                                                      .currentState!.count ~/ 2]}", style: TextStyle(
                                                  color: AppColors
                                                      .colorPrimary,
                                                  fontSize: 25.sp))
                                          ),
                                          Text("次",
                                              style: TextStyle(
                                                  color: AppColors.colorPrimary,
                                                  fontSize: 25.sp)),
                                        ],
                                      ))
                                ],
                              ),
                              SizedBox(height: 20.h),
                              InkWell(
                                onTap: () {
                                  controller.showDatePicker(context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.dateTimeString.value,
                                      style: TextStyle(fontSize: 20.sp,
                                          color: AppColors.golden),
                                    ),
                                    SizedBox(height: 10.h),
                                    const Divider(
                                        height: 1, color: Colors.black26),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              InkWell(
                                onTap: () {
                                  // locationController.country.clear();
                                  // locationController.state.clear();
                                  // locationController.city.clear();
                                  // Get.dialog(
                                  //     Dialog(backgroundColor: Colors.white12,
                                  //         shape: const RoundedRectangleBorder(
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(12))
                                  //         ),
                                  //         insetPadding: EdgeInsets.symmetric(
                                  //             horizontal: 20.w,
                                  //             vertical: 100.h),
                                  //         child: const LocationView()),
                                  //     barrierColor: Colors.black26
                                  // );
                                  showSnackBar("未来将支持更多起卦方式～", context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("起卦方式:在线起卦",
                                        style: TextStyle(fontSize: 20.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.golden),
                                        maxLines: 1),
                                    SizedBox(height: 10.h),
                                    const Divider(
                                        height: 1, color: Colors.black26),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Gif(
                                controller.update, key: controller.globalKey,),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Text("保存此盘",
                                      style: TextStyle(fontSize: 16.sp)),
                                  Obx(() =>
                                      Center(
                                        child: Transform.scale(
                                          scale: 0.5.w,
                                          child: Switch(
                                            value: controller.switchValue.value,
                                            onChanged: controller
                                                .onSwitchValueChanged,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () async {
                      switch (controller.panType) {
                        case 1:
                          if(controller.switchValue.value == true){
                            var isSuccess = await controller.addDataBase(context);
                            if(isSuccess){
                              Get.toNamed("/bazi");
                            }
                          }
                          if(controller.switchValue.value == false){
                            Get.toNamed("/bazi");
                          }
                          break;
                        case 2:
                          Get.toNamed("/ziwei");
                          break;
                        case 3:
                          if(controller.globalKey.currentState != null){
                            if(controller.globalKey.currentState!.count >= 12){
                              controller.globalKey.currentState!.Counts();

                              String M = controller.time.month.toString();
                              String D = controller.time.day.toString();
                              String H = controller.time.hour.toString();
                              String m = controller.time.minute.toString();
                              String S = controller.time.second.toString();

                              if(controller.time.month.toString().length == 1){
                                M = "0${controller.time.month}";
                                // print("M" + M);
                              }

                              // print("M" + M);

                              if(controller.time.day.toString().length == 1){
                                D = "0${controller.time.day}";
                              }

                              if(controller.time.hour.toString().length == 1){
                                H = "0${controller.time.hour}";
                              }

                              if(controller.time.second.toString().length == 1){
                                S = "0${controller.time.second}";
                              }

                              if(controller.time.minute.toString().length == 1){
                                m = "0${controller.time.minute}";
                                // print("M" + M);
                              }

                              // String time = "controller.time";

                              Get.to(CommonWebView(
                                  'https://app.bububz.com/sixYao.html?json={"time":"${controller.time.year}$M$D$H$m$S","type":5,"sex":"MAN","scet":1,"deviceNumber":"","g1":[${controller.globalKey.currentState!.g1[0]},${controller.globalKey.currentState!.g1[1]}],'
                                      '"g2":[${controller.globalKey.currentState!.g2[0]},${controller.globalKey.currentState!.g2[1]}],'
                                      '"g3":[${controller.globalKey.currentState!.g3[0]},${controller.globalKey.currentState!.g3[1]}],'
                                      '"g4":[${controller.globalKey.currentState!.g4[0]},${controller.globalKey.currentState!.g4[1]}],'
                                      '"g5":[${controller.globalKey.currentState!.g5[0]},${controller.globalKey.currentState!.g5[1]}],'
                                      '"g6":[${controller.globalKey.currentState!.g6[0]},${controller.globalKey.currentState!.g6[1]}]}', "六爻"));
                              debugPrint('https://app.bububz.com/sixYao.html?json={"time":"${controller.time.year}$M$D$H$m$S","type":5,"sex":"MAN","scet":1,"deviceNumber":"","g1":[${controller.globalKey.currentState!.g1[0]},${controller.globalKey.currentState!.g1[1]}],'
                                  '"g2":[${controller.globalKey.currentState!.g2[0]},${controller.globalKey.currentState!.g2[1]}],'
                                  '"g3":[${controller.globalKey.currentState!.g3[0]},${controller.globalKey.currentState!.g3[1]}],'
                                  '"g4":[${controller.globalKey.currentState!.g4[0]},${controller.globalKey.currentState!.g4[1]}],'
                                  '"g5":[${controller.globalKey.currentState!.g5[0]},${controller.globalKey.currentState!.g5[1]}],'
                                  '"g6":[${controller.globalKey.currentState!.g6[0]},${controller.globalKey.currentState!.g6[1]}]}');
                            }
                            else {
                              showSnackBar("六爻～需要6次摇卦哦～", context);
                            }
                          }
                          break;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: double.infinity,
                      height: 65.h,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                          child: Text("开始排盘", style: TextStyle(color: AppColors
                              .golden, fontSize: 25.sp))),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                showSnackBar("正在☕️开发中。。。", context);
                              },
                              child: Container(
                                width: 200.w,
                                height: 50.h,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))
                                ),
                                child: Center(
                                    child: Text("开始合盘", style: TextStyle(
                                        color: AppColors.golden,
                                        fontSize: 20.sp))),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: (){
                                // showSnackBar("正在☕️开发中。。。", context);
                                // var tabsController = Get.put(TabsController());
                                // tabsController.pageController.jumpToPage(3);
                                // tabsController.currentIndex.value = 3;
                              },
                              child: Container(
                                width: 200.w,
                                height: 50.h,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))
                                ),
                                child: Center(
                                    child: Text("更多设置", style: TextStyle(
                                        color: AppColors.golden,
                                        fontSize: 20.sp))),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(width: 10.w),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/calendar");
                              },
                              child: Container(
                                width: 140.w,
                                height: 140.h,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))
                                ),
                                child: Center(child: Text("历", style: TextStyle(
                                    color: AppColors.golden, fontSize: 50.sp))),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}

class Gif extends StatefulWidget {
  Gif(this.update, {super.key});

  Function update;

  @override
  State<Gif> createState() => GifState();
}

class GifState extends State<Gif> with SingleTickerProviderStateMixin {

  String url = "assets/icon/6money2.png";
  String url2 = "assets/icon/6money2.png";
  String url3 = "assets/icon/6money2.png";
  Timer? timer;
  int count = 0;

  //无字true
  List<bool> list = [];
  List<bool> list2 = [];
  List<bool> list3 = [];

  List<int> g1 = [];
  List<int> g2 = [];
  List<int> g3 = [];
  List<int> g4 = [];
  List<int> g5 = [];
  List<int> g6 = [];

  Counts(){

    for(int i = 0;i < list.length;i++){
      int o = 0;
      int z = 0;
      if(list[i] == true){
        o++;
      }
      else {
        z++;
      }

      if(list2[i] == true){
        o++;
      }
      else {
        z++;
      }

      if(list3[i] == true){
        o++;
      }
      else {
        z++;
      }

      switch(i){
        case 0:
          g1 = [z,o];
          break;
        case 1:
          g2 = [z,o];
          break;
        case 2:
          g3 = [z,o];
          break;
        case 3:
          g4 = [z,o];
          break;
        case 4:
          g5 = [z,o];
          break;
        case 5:
          g6 = [z,o];
          break;
      }

      // debugPrint(g1.toString());

    }

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if(count < 12){
            if (timer == null) {
              timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
                setState(() {

                  var random = Random();

                  if (random.nextInt(2) == 1) {
                    url = "assets/icon/6money1.png";
                  }
                  else {
                    url = "assets/icon/6money2.png";
                  }

                  if (random.nextInt(2) == 1) {
                    url2 = "assets/icon/6money1.png";
                  }
                  else {
                    url2 = "assets/icon/6money2.png";
                  }

                  if (random.nextInt(2) == 1) {
                    url3 = "assets/icon/6money1.png";
                  }
                  else {
                    url3 = "assets/icon/6money2.png";
                  }

                });
              });
            }
            else {
              timer!.cancel();
              timer = null;
              // print(timer);
              // print(url);
              // print(count);
              if (url == "assets/icon/6money2.png") {
                list.add(true);
              }
              else {
                list.add(false);
              }

              if (url2 == "assets/icon/6money2.png") {
                list2.add(true);
              }
              else {
                list2.add(false);
              }

              if (url3 == "assets/icon/6money2.png") {
                list3.add(true);
              }
              else {
                list3.add(false);
              }

              widget.update();
              setState(() {

              });
            }
          }
          else {
            showSnackBar("六爻算尽天下事～不要再多一爻啦～",context);
          }
          count++;
        },
        child: Opacity(
          opacity: timer == null ? 1 : 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(url, width: 80.w),
              Image.asset(url2, width: 80.w),
              Image.asset(url3, width: 80.w),
            ],
          ),
        ),
      ),
    );
  }
}