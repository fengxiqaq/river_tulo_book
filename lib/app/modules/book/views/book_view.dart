import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/app_color.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookController());
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffeeeeee),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text('书房', style: TextStyle(fontSize: 25.sp)),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => controller.onSwitchValueChanged(1),
                    child: Container(
                        decoration: BoxDecoration(
                          border: controller.switchValue.value == 1
                              ? Border.all(
                                  color: AppColors.colorPrimary, width: 2.w)
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text("山",
                            style: TextStyle(
                                color: controller.switchValue.value == 1
                                    ? AppColors.colorPrimary
                                    : Colors.black,
                                fontSize: 25.sp))),
                  ),
                  InkWell(
                    onTap: () => controller.onSwitchValueChanged(2),
                    child: Container(
                        decoration: BoxDecoration(
                          border: controller.switchValue.value == 2
                              ? Border.all(
                                  color: AppColors.colorPrimary, width: 2.w)
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text("医",
                            style: TextStyle(
                                color: controller.switchValue.value == 2
                                    ? AppColors.colorPrimary
                                    : Colors.black,
                                fontSize: 25.sp))),
                  ),
                  InkWell(
                    onTap: () => controller.onSwitchValueChanged(3),
                    child: Container(
                        decoration: BoxDecoration(
                          border: controller.switchValue.value == 3
                              ? Border.all(
                                  color: AppColors.colorPrimary, width: 2.w)
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text("命",
                            style: TextStyle(
                                color: controller.switchValue.value == 3
                                    ? AppColors.colorPrimary
                                    : Colors.black,
                                fontSize: 25.sp))),
                  ),
                  InkWell(
                    onTap: () => controller.onSwitchValueChanged(4),
                    child: Container(
                        decoration: BoxDecoration(
                          border: controller.switchValue.value == 4
                              ? Border.all(
                                  color: AppColors.colorPrimary, width: 2.w)
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text("相",
                            style: TextStyle(
                                color: controller.switchValue.value == 4
                                    ? AppColors.colorPrimary
                                    : Colors.black,
                                fontSize: 25.sp))),
                  ),
                  InkWell(
                    onTap: () => controller.onSwitchValueChanged(5),
                    child: Container(
                        decoration: BoxDecoration(
                          border: controller.switchValue.value == 5
                              ? Border.all(
                                  color: AppColors.colorPrimary, width: 2.w)
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text("卜",
                            style: TextStyle(
                                color: controller.switchValue.value == 5
                                    ? AppColors.colorPrimary
                                    : Colors.black,
                                fontSize: 25.sp))),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Container(
              //   width: double.infinity,
              //   height: 200,
              //   color: AppColors.colorPrimary,
              //   child: Center(
              //     child: Text("占位Banner(图片)",style: TextStyle(fontSize: 20)),
              //   ),
              // ),
              // PageView(
              //   children: const [
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //     Text("data"),
              //   ],
              // )
              Row(
                children: [
                  Container(
                    width: 100.w,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            // color:AppColors.colorPrimary,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      width: 5,
                                      height: 30,
                                      color: AppColors.colorPrimary),
                                ),
                                Center(
                                  child: Text("拳法",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.colorPrimary)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text("拳法",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.golden)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text("拳法",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.golden)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text("拳法",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.golden)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [
                          Container(
                            height: 200.h,
                            decoration: const BoxDecoration(
                              color: Color(0xffeeeeee),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                            child: Column(
                              children: [
                                Image.network("https://www.iwzbz.com/h5bookface/v1/bk_3_1_1.png",height: 120.h,fit: BoxFit.cover),
                                Text("八段锦",style: TextStyle(color: AppColors.colorPrimary,fontSize: 16.sp))
                              ],
                            ),
                          ),
                          Container(
                            height: 200.h,
                            decoration: const BoxDecoration(
                                color: Color(0xffeeeeee),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                            child: Column(
                              children: [
                                Image.network("https://www.iwzbz.com/h5bookface/v1/bk_3_1_1.png",height: 120.h,fit: BoxFit.cover),
                                Text("八段锦",style: TextStyle(color: AppColors.colorPrimary,fontSize: 16.sp))
                              ],
                            ),
                          ),
                          Container(
                            height: 200.h,
                            decoration: const BoxDecoration(
                                color: Color(0xffeeeeee),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                            child: Column(
                              children: [
                                Image.network("https://www.iwzbz.com/h5bookface/v1/bk_3_1_1.png",height: 120.h,fit: BoxFit.cover),
                                Text("八段锦",style: TextStyle(color: AppColors.colorPrimary,fontSize: 16.sp))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
