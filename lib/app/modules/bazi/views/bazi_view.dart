import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/bazi_controller.dart';

class BaziView extends GetView<BaziController> {
  const BaziView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('八字排盘'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller.webController),
    );
  }
}
