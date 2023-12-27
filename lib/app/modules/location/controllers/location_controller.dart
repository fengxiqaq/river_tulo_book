import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/common.dart';
import 'package:river_tulo_book/app/common/locationpicker/model/location_model.dart';
import '../../../common/getSolarTime.dart';
import '../../home/controllers/home_controller.dart';

class LocationController extends GetxController {

  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController timezones = TextEditingController();
  final homeController = Get.put(HomeController());
  RxString countryValue = "".obs;
  RxString stateValue = "".obs;
  RxString cityValue = "".obs;
  Rx<Cities>? cities = Cities().obs;
  Rx<States>? states = States().obs;
  Rx<Location> locations = Location().obs;
  var flag = true.obs;
  var switchXiaValue = false.obs;

  @override
  void onInit() {
    super.onInit();
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
    DateTime solarTime;
    if(type == 1){
      countryValue.value = country.text;
      stateValue.value = state.text;
      cityValue.value = city.text;
      // homeController.longitude.value =
      // cities?.value.longitude ?? "";
      // homeController.latitude.value =
      // cities?.value.latitude ?? "";

      String longitude = "";
      String latitude = "";
      print(stateValue);
      if(cityValue.value != "") {
        homeController.longitude.value = cities!.value.longitude!;
        homeController.latitude.value = cities!.value.latitude!;
        longitude = cities!.value.longitude!;
        latitude = cities!.value.latitude!;
      }
      else {
        if(stateValue.value != ""){
          homeController.longitude.value = states!.value.longitude!;
          homeController.latitude.value = states!.value.latitude!;
          longitude = states!.value.longitude!;
          latitude = states!.value.latitude!;
        }
        else {
          if(countryValue.value != ""){
            homeController.longitude.value = locations.value.longitude!;
            homeController.latitude.value = locations.value.latitude!;
            longitude = locations.value.longitude!;
            latitude = locations.value.latitude!;
          }
          else {
            buildSnackbar("请选择地区", "", SnackPosition.TOP, EdgeInsets.only(left: 10.w,right: 10.w,top: 35.h));
            return;
          }
        }
      }
      timeZone = await SolarTime.getTimeZone({"longitude":longitude,"latitude":latitude});
      solarTime = SolarTime.getSolarTime(homeController.time,double.parse(longitude),double.parse(latitude));
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
      solarTime = SolarTime.getSolarTime(homeController.time,double.parse(homeController.longitude.value),double.parse(homeController.latitude.value));
    }

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
