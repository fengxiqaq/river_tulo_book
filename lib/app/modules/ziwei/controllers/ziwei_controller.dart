import 'package:flutter/widgets.dart';
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
    var hour = 0;
    debugPrint(homeController.time.hour.toString());
    if(homeController.time.hour == 0){
      hour = 0;
    }
    else if(homeController.time.hour == 1 || homeController.time.hour == 2){
      hour = 1;
    }
    else if(homeController.time.hour == 3 || homeController.time.hour == 4){
      hour = 2;
    }
    else if(homeController.time.hour == 5 || homeController.time.hour == 6){
      hour = 3;
    }
    else if(homeController.time.hour == 7 || homeController.time.hour == 8){
      hour = 4;
    }
    else if(homeController.time.hour == 9 || homeController.time.hour == 10){
      hour = 5;
    }
    else if(homeController.time.hour == 11 || homeController.time.hour == 12){
      hour = 6;
    }
    else if(homeController.time.hour == 13 || homeController.time.hour == 14){
      hour = 7;
    }
    else if(homeController.time.hour == 15 || homeController.time.hour == 16){
      hour = 8;
    }
    else if(homeController.time.hour == 17 || homeController.time.hour == 18){
      hour = 9;
    }
    else if(homeController.time.hour == 19 || homeController.time.hour == 20){
      hour = 10;
    }
    else if(homeController.time.hour == 21 || homeController.time.hour == 22){
      hour = 11;
    }
    else if(homeController.time.hour == 23){
      hour = 12;
    }

    var solarTimeString = homeController.solarTime.value.replaceAll("/", "-");
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://ziwei.pub/astrolabe/?d=$solarTimeString&t=$hour&leap=false&g=${homeController.switchSexValue.isTrue ? "male":"female"}&type=solar&n=${homeController.name.text == "" ? "案例1" : homeController.name.text}'))
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
