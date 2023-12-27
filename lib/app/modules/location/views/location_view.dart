import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/common.dart';
import 'package:river_tulo_book/app/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../common/getSolarTime.dart';
import '../../../common/locationpicker/country_state_city_picker.dart';
import '../../../data/app_color.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
        ),
        height: controller.flag.value ? 500.h : null,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: const Text("选择你的地区",style: TextStyle(color: AppColors.golden)),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 20.w,right: 20.w),
                  child: Obx(() {
                    return ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: controller.flag.value ? [
                        // SizedBox(height: 20.h),
                        Obx(() =>
                            Row(
                              children: [
                                Text("是否夏令时:",style: TextStyle(fontSize: 16)),
                                Transform.scale(
                                  scale: 0.5.w,
                                  child: Switch(
                                    value: controller.switchXiaValue.value,
                                    onChanged: controller.onSwitchXiaChanged,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 20.h),
                        CountryStateCityPicker(
                            country: controller.country,
                            state: controller.state,
                            city: controller.city,
                            dialogColor: Colors.grey.shade200,
                            textFieldDecoration: InputDecoration(
                                fillColor: AppColors.golden,
                                filled: true,
                                suffixIcon: const Icon(
                                    Icons.arrow_downward_rounded),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none))
                        ),
                        SizedBox(height: 40.h),
                        InkWell(
                            onTap: () => controller.checkSuccess(1),
                            child: SizedBox(
                                width: double.infinity,
                                child: Center(child: Text("选定", style: TextStyle(
                                    color: AppColors.golden,
                                    fontSize: 24.sp))))
                        ),
                        SizedBox(height: 40.h),
                        InkWell(
                            onTap: () => controller.updateFlag(),
                            child: Center(
                              child: Text("找不到出生地？改用地图搜寻吧！", style: TextStyle(
                                  color: AppColors.golden, fontSize: 16.sp)),
                            )
                        ),
                        SizedBox(height: 20.h),
                      ] : [
                        // SizedBox(height: 40.h),
                        Obx(() =>
                            Row(
                              children: [
                                Text("是否夏令时:",style: TextStyle(fontSize: 16)),
                                Transform.scale(
                                  scale: 0.5.w,
                                  child: Switch(
                                    value: controller.switchXiaValue.value,
                                    onChanged: controller.onSwitchXiaChanged,
                                  ),
                                ),
                              ],
                            )),
                        // SizedBox(height: 20.h),
                        Text("1:进入网页", style: TextStyle(
                            color: AppColors.golden, fontSize: 16.sp)),
                        SizedBox(height: 10.h),
                        Text("2:地图选点（支持国外，直接搜索）", style: TextStyle(
                            color: AppColors.golden, fontSize: 16.sp)),
                        SizedBox(height: 10.h),
                        Text("3:复制粘贴", style: TextStyle(
                            color: AppColors.golden, fontSize: 16.sp)),
                        SizedBox(height: 40.h),
                        TextField(
                          controller: controller.long,
                          onTap: () {
                            // setState(() => _title = 'Country');
                            // _showDialog(context);
                          },
                          decoration: const InputDecoration(
                              isDense: true,
                              hintText: '粘贴经纬度',
                              suffixIcon: Icon(Icons.arrow_drop_down,
                                  color: AppColors.colorPrimary),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          controller: controller.timezones,
                          decoration: const InputDecoration(
                              isDense: true,
                              hintText: '将帮你自动确定时区',
                              suffixIcon: Icon(Icons.arrow_drop_down,
                                  color: AppColors.colorPrimary),
                              border: OutlineInputBorder()),
                          readOnly: true,
                        ),
                        SizedBox(height: 40.h),
                        InkWell(
                          onTap: (){
                            Get.to(CommonWebView("https://api.map.baidu.com/lbsapi/getpoint/index.html","第一步"));
                          },
                          child: Container(
                              height: 100.h,
                              color: AppColors.colorPrimary,
                              child: Center(child: Text("点击我进入网页",style: TextStyle(color: Colors.white,fontSize: 24.sp)))
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                            onTap: () => controller.checkSuccess(2),
                            child: SizedBox(
                                width: double.infinity,
                                child: Center(child: Text("选定", style: TextStyle(
                                    color: AppColors.golden,
                                    fontSize: 24.sp))))
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                            onTap: () => controller.updateFlag(),
                            child: Text("回到城市选单", style: TextStyle(
                                color: AppColors.golden, fontSize: 16.sp))
                        ),
                      ],
                    );
                  })
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      );
    });
  }
}
