import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/keepAliveWrapper.dart';

import '../../home/views/home_view.dart';

class TabsController extends GetxController {

  final count = 0.obs;
  var switchValue = false.obs;
  var currentIndex = 0.obs;
  late PageController pageController;

  var pages = const [
    KeepAliveWrapper(child: HomeView()),
    Text("2"),
    Text("3"),
    Text("4"),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
