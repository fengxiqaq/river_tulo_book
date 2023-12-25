import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../../common/common.dart';
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
              Expanded(
                child: PageView(
                  children: [
                    bookClass(type: 0,controller:    Get.put(BookController());),
                    bookClass(type: 0),
                    bookClass(type: 0),
                    bookClass(type: 0),
                    bookClass(type: 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class bookClass extends StatelessWidget {

  int type = 0;

  bookClass({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          child: Column(
            children: [
              InkWell(
                onTap: () {

                },
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
          child: GridView.count(
            // shrinkWrap: true,
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
            ],
          ),
        )
      ],
    );
  }
}

class BookView2 extends StatefulWidget {
  const BookView2({super.key});

  @override
  State<BookView2> createState() => _BookView2State();
}

class _BookView2State extends State<BookView2> {

  String remotePDFpath = "";

  late PDFViewController _pdfViewController;
  int currentPage = 0;
  int pageCount = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
      ),
      body: Stack(
        children: [
          PDF(
            onViewCreated: (PDFViewController pdfViewController) async {
              _pdfViewController = pdfViewController;
              currentPage = (await pdfViewController.getCurrentPage())!;
              pageCount = (await pdfViewController.getPageCount())!;
              debugPrint(pageCount.toString());
              setState(() {

              });
            },
            // swipeHorizontal: true,
            defaultPage: 0,
            onPageChanged: (page,total){
              currentPage = page!;
              _pdfViewController.setPage(page);
              setState(() {

              });
            }
          ).cachedFromUrl('https://112-101-10-70.pd1.123pan.cn:30443/download-cdn.123pan.cn/123-65/f8e205a3/1824866279-0/f8e205a3e2264ec324d7441f0c361041/c-m20?v=5&t=1703558764&s=17035587646060358d9159d378b27a424371eecbef&r=W2CWZA&bzc=2&bzs=313832343836363237393a34333039333434343a333437313131333a31383234383636323739&filename=%E6%A2%85%E8%8A%B1%E6%98%93%E6%95%B8.pdf&x-mf-biz-cid=741cf338-358b-4617-abd5-345b71ebbe5f-6eaa77&auto_redirect=0&ndcp=1&cache_type=1&xmfcid=7191a783-af56-4880-93d9-4bf2bce026be-1-50111d3b1'),
          Positioned(right: 40.w,bottom:40.w,child: Text("${currentPage + 1} / $pageCount")),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        String input = "";
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text("输入你要跳转的页面"),
            content: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (text){
                input = text;
              },
            ),
            actions: [
              TextButton(onPressed: (){
                if(input == ""){

                }
                else if(int.parse(input) > pageCount){
                  buildSnackbar("没有这么多页啦～","message",SnackPosition.BOTTOM,EdgeInsets.only(left: 10.w,right: 10.w,bottom: 40.h));
                }
                else {
                  setState(() {
                    _pdfViewController.setPage(int.parse(input) - 1);
                  });
                }
                Navigator.pop(context);
              }, child: const Text("确定")),
            ],
          );
        });
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
