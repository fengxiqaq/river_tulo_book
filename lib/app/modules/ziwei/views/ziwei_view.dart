import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../common/datepicker/date_format.dart';
import '../controllers/ziwei_controller.dart';

class ZiweiView extends GetView<ZiweiController> {
  const ZiweiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('紫薇排盘'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        WebViewWidget(controller: controller.webController)
        // SafeArea(top: true,child: ),
        // SafeArea(
        //   child: SizedBox(
        //     height: 56.h,
        //     child: AppBar(
        //       title: const Text('紫薇排盘'),
        //       centerTitle: true,
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
