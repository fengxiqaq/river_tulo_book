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
      ..setUserAgent("Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1 Edg/117.0.0.0")
      ..enableZoom(false);
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
