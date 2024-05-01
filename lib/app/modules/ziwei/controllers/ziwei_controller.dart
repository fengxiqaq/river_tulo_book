import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../home/controllers/home_controller.dart';
import '../../location/controllers/location_controller.dart';

class ZiweiController extends GetxController {

  late WebViewController webController;
  final homeController = Get.put(HomeController());
  final locationController = Get.put(LocationController());

  @override
  void onInit() {
    super.onInit();
    var solarTimeString = homeController.solarTime.value.replaceAll("/", "-");
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://ziwei.pub/astrolabe/?d=$solarTimeString&t=10&leap=false&g=${homeController.switchSexValue.isTrue ? "male":"female"}&type=solar&n=${homeController.name.text == "" ? "案例1" : homeController.name.text}'))
      ..setUserAgent("Mozilla/5.0 (Linux; Android 11; Pixel 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36 Edg/117.0.0.0")
      ..enableZoom(false)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          webController.runJavaScript(
              "javascript:(function() { var head = document.querySelector('#app > div > div > div.wzbz_header');head.remove(head);var footer = document.querySelector('#app > div > div > div.tab_block');})()"
          );
        },
        // onNavigationRequest: (NavigationRequest request) {
        //   return NavigationDecision.prevent;
        // },
      ));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
