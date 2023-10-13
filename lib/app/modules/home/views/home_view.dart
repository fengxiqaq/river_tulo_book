import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/data/app_color.dart';
import 'package:river_tulo_book/app/modules/location/controllers/location_controller.dart';
import '../../location/views/location_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final locationController = Get.put(LocationController());
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffeeeeee),
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
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("切换", style: TextStyle(
                              fontSize: 25.sp, color: AppColors.colorPrimary),
                              textAlign: TextAlign.end),
                          SizedBox(width: 10.w),
                          Image.asset("assets/icon/replace.png",height: 25.h),
                          SizedBox(width: 5.w),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 400.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
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
                                    color: Colors.black,
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        controller.onSwitchSexValueChanged(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: controller.switchSexValue
                                              .value ? Border.all(
                                            color: AppColors.colorPrimary,
                                            width: 2.w,
                                          ) : null,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text("乾", style: TextStyle(
                                            color: AppColors.colorPrimary,
                                            fontSize: 25.sp))
                                    ),
                                  ),
                                  Text("?", style: TextStyle(
                                      color: AppColors.colorPrimary,
                                      fontSize: 25.sp)),
                                  InkWell(
                                    onTap: () =>
                                        controller.onSwitchSexValueChanged(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: controller.switchSexValue
                                              .value ? null : Border.all(
                                            color: AppColors.colorPrimary,
                                            width: 2.w,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text("坤", style: TextStyle(
                                            color: AppColors.colorPrimary,
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
                        child: Text(
                          controller.dateTimeString.value,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Divider(height: 1, color: Colors.black),
                      SizedBox(height: 10.h),
                      InkWell(
                          onTap: () {
                            locationController.country.clear();
                            locationController.state.clear();
                            locationController.city.clear();
                            Get.dialog(
                                Dialog(insetPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 70.h),
                                child: const LocationView()
                            ));
                          },
                          child: Text(locationController.countryValue.isEmpty || locationController.countryValue == ""  ? "未知地区-北京" : "${locationController.countryValue} ${locationController.stateValue} ${locationController.cityValue}",
                              style: TextStyle(fontSize: 20.sp,overflow: TextOverflow.ellipsis),maxLines: 1)
                      ),
                      SizedBox(height: 10.h),
                      const Divider(height: 1, color: Colors.black),
                      SizedBox(height: 45.h),
                      Text("时区: ${controller.timeZone}", style: TextStyle(fontSize: 16.sp)),
                      Text("真太阳时：${controller.solarTime}", style: TextStyle(fontSize: 16.sp)),
                      Text("地址经纬: ${controller.longitude} ${controller.latitude}", style: TextStyle(fontSize: 16.sp)),
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
                          Text("保存此盘", style: TextStyle(fontSize: 16.sp)),
                          Obx(() =>
                              Center(
                                child: Transform.scale(
                                  scale: 0.5.w,
                                  child: Switch(
                                    value: controller.switchValue.value,
                                    onChanged: controller.onSwitchValueChanged,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: (){
                    Get.toNamed("/bazi");
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
                          Container(
                              width: 200.w,
                              height: 50.h,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              child: Center(child: Text("开始合盘", style: TextStyle(
                                  color: AppColors.golden, fontSize: 20.sp))),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: 200.w,
                            height: 50.h,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))
                            ),
                            child: Center(child: Text("更多设置", style: TextStyle(
                                color: AppColors.golden, fontSize: 20.sp))),
                          ),
                        ],
                      )),
                      SizedBox(width: 10.w),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
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
  }
}