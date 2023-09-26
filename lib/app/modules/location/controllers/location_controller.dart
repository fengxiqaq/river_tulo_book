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
  var data = {"FUNC":"BDayInfo","longitude":"","latitude":"","TZName":"Asia/Shanghai","Year":"2023"};

  RxString countryValue = "".obs;
  RxString stateValue = "".obs;
  RxString cityValue = "".obs;
  Rx<Cities> cities = Cities().obs;
  var flag = true.obs;

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

  void checkSuccess() async {
    countryValue.value = country.text;
    stateValue.value = state.text;
    cityValue.value = city.text;
    homeController.longitude.value =
    cities.value.longitude!;
    homeController.latitude.value =
    cities.value.latitude!;
    var timeZone = await SolarTime.getTimeZone({"longitude":cities.value.longitude!,"latitude":cities.value.latitude!});
    data = {"FUNC":"BDayInfo","longitude":cities.value.longitude!,"latitude":cities.value.latitude!,"TZName":timeZone,"Year":homeController.time.year.toString(),"Month":homeController.time.month.toString(),"Day":homeController.time.day.toString(),"Hour":homeController.time.hour.toString(),"Min":homeController.time.minute.toString(),"Sec":homeController.time.second.toString()};
    homeController.solarTime.value = await SolarTime.getSolarTime(data);
    homeController.timeZone.value= timeZone;
    homeController.update();
    Get.back();
  }

  Future<void> checkSuccess2() async {
    countryValue.value = "其他地区";
    stateValue.value = "";
    cityValue.value = "";
    String text = long.text;
    var split = text.split(",");
    homeController.longitude.value = split[0];
    homeController.latitude.value = split[1];
    var timeZone = await SolarTime.getTimeZone({"longitude":split[0],"latitude":split[1]});
    data = {"FUNC":"BDayInfo","longitude":split[0],"latitude":split[1],"TZName":timeZone,"Year":homeController.time.year.toString(),"Month":homeController.time.month.toString(),"Day":homeController.time.day.toString(),"Hour":homeController.time.hour.toString(),"Min":homeController.time.minute.toString(),"Sec":homeController.time.second.toString()};
    homeController.solarTime.value = await SolarTime.getSolarTime(data);
    homeController.timeZone.value = timeZone;
    homeController.update();
    Get.back();
  }

}
