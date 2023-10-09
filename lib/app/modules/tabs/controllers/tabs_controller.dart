import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/keepAliveWrapper.dart';
import 'package:river_tulo_book/app/modules/book/views/book_view.dart';
import 'package:river_tulo_book/app/modules/my/views/my_view.dart';
import '../../home/views/home_view.dart';

class TabsController extends GetxController {

  final count = 0.obs;
  var switchValue = false.obs;
  var currentIndex = 0.obs;
  late PageController pageController;

  var pages = const [
    KeepAliveWrapper(child: HomeView()),
    KeepAliveWrapper(child: BookView()),
    Center(child: Text("敬请期待",style: TextStyle(fontSize: 20))),
    KeepAliveWrapper(child: MyView()),
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
