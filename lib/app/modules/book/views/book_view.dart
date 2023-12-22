import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
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
                          InkWell(
                            onTap: (){
                              Get.to(BookView2());
                            },
                            child: Container(
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

class BookView2 extends StatefulWidget {
  const BookView2({super.key});

  @override
  State<BookView2> createState() => _BookView2State();
}

class _BookView2State extends State<BookView2> {

  String remotePDFpath = "";
  int pages = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
      ),
      body: Stack(
        children: [
          PDF(
            // swipeHorizontal: true,
            onPageChanged:(pages,total){
              setState(() {
                this.pages = pages!;
                this.total = total!;
              });
            },
          ).cachedFromUrl('https://viewscreen.githubusercontent.com/view/pdf?browser=unknown_browser&bypass_fastly=true&color_mode=auto&commit=bfe604175415e5f23c81e14b87a18b51a897c1ee&device=unknown_device&docs_host=https%3A%2F%2Fdocs.github.com&enc_url=68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f66656e6778697161712f72697665725f74756c6f5f626f6f6b732f626665363034313735343135653566323363383165313462383761313862353161383937633165652fe6a285e88ab1e69893e695b02e706466&logged_in=false&nwo=fengxiqaq%2Friver_tulo_books&path=%E6%A2%85%E8%8A%B1%E6%98%93%E6%95%B0.pdf&platform=unknown_platform&repository_id=734234287&repository_type=Repository&version=0'),
          Positioned(right: 40.w,bottom:40.w,child: Text("${pages + 1} / $total")),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },child: Text("指定")),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  @override
  void initState() {
    super.initState();
    // createFileOfPdfUrl().then((f) {
    //   setState(() {
    //     remotePDFpath = f.path;
    //   });
    // });
  }

}
