import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/locationpicker/model/location_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../common/getSolarTime.dart';
import '../../home/controllers/home_controller.dart';

class LocationController extends GetxController {

  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController timezones = TextEditingController();
  final homeController = Get.put(HomeController());
  late WebViewController webController;
  RxString countryValue = "".obs;
  RxString stateValue = "".obs;
  RxString cityValue = "".obs;
  Rx<Cities> cities = Cities().obs;
  var flag = true.obs;
  var switchXiaValue = false.obs;

  @override
  void onInit() {
    super.onInit();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://api.map.baidu.com/lbsapi/getpoint/index.html'))
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

  void updateFlag(){
    flag.value = !flag.value;
    update();
  }

  void checkSuccess(type) async {
    var timeZone;
    if(type == 1){
      countryValue.value = country.text;
      stateValue.value = state.text;
      cityValue.value = city.text;
      homeController.longitude.value =
      cities.value.longitude!;
      homeController.latitude.value =
      cities.value.latitude!;
      timeZone = await SolarTime.getTimeZone({"longitude":cities.value.longitude!,"latitude":cities.value.latitude!});
    }
    else {
      countryValue.value = "其他地区";
      stateValue.value = "";
      cityValue.value = "";
      String text = long.text;
      var split = text.split(",");
      homeController.longitude.value = split[0];
      homeController.latitude.value = split[1];
      timeZone = await SolarTime.getTimeZone({"longitude":split[0],"latitude":split[1]});
    }
    var solarTime = SolarTime.getSolarTime(homeController.time,double.parse(cities.value.longitude!),double.parse(cities.value.latitude!));
    if(switchXiaValue.value){
      homeController.solarTime.value = solarTime.subtract(const Duration(hours: 1)).toString();
    }
    else {
      homeController.solarTime.value = solarTime.toString();
    }
    homeController.timeZone.value= timeZone;
    homeController.update();
    Get.back();
  }

  // checkSuccess2() async {
  //   countryValue.value = "其他地区";
  //   stateValue.value = "";
  //   cityValue.value = "";
  //   String text = long.text;
  //   var split = text.split(",");
  //   homeController.longitude.value = split[0];
  //   homeController.latitude.value = split[1];
  //   var timeZone = await SolarTime.getTimeZone({"longitude":split[0],"latitude":split[1]});
  //   homeController.solarTime.value = SolarTime.getSolarTime(homeController.time,double.parse(cities.value.longitude!),double.parse(cities.value.latitude!)).toString();
  //   homeController.timeZone.value = timeZone;
  //   homeController.update();
  //   Get.back();
  // }

  onSwitchXiaChanged(bool value){
    switchXiaValue.value = value;
  }

}
