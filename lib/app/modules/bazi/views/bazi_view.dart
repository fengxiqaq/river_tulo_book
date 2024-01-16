import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/bazi_controller.dart';

class BaziView extends GetView<BaziController> {
  const BaziView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('八字排盘'),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        SafeArea(top: true,child: WebViewWidget(controller: controller.webController)),
        SafeArea(
          child: SizedBox(
            height: 56.h,
            child: AppBar(
              title: const Text('八字排盘'),
              centerTitle: true,
            ),
          ),
        ),
      ]),
    );
  }
}