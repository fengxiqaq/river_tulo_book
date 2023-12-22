import 'package:get/get.dart';
import 'package:river_tulo_book/app/modules/location/controllers/location_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../home/controllers/home_controller.dart';

class BaziController extends GetxController {

  late WebViewController webController;
  final homeController = Get.put(HomeController());
  final locationController = Get.put(LocationController());

  @override
  void onInit() {
    super.onInit();
    var solarTimeString = homeController.solarTime.value.replaceAll("/", "-");
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://bz.iwzwh.com/#/main/paipan?parms=$solarTimeString|${homeController.name.text == "" ? "案例1" : homeController.name.text}|${homeController.switchSexValue.isTrue ? "1":"0"}|${homeController.time.year}-${homeController.time.month}-${homeController.time.day} ${homeController.time.hour}:${homeController.time.minute}|${locationController.city.text == "" ? "${homeController.longitude} ${homeController.latitude}" : locationController.city.text}&type=0&isCreate=true&isRefresh=true'))
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
