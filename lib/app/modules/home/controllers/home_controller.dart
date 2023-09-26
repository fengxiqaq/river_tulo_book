import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/getSolarTime.dart';
import '../../../common/datepicker/flutter_lunar_datetime_picker.dart';

class HomeController extends GetxController {

  var name = TextEditingController();
  late DateTime time;
  var switchValue = false.obs;
  //ture 乾 false 坤
  var switchSexValue = true.obs;
  var dateTimeString = "".obs;
  var isSaving = true.obs;
  var latitude = "39.907501".obs;
  var longitude = "116.397232".obs;
  var solarTime = "".obs;
  var timeZone = "Asia/Shanghai".obs;

  @override
  void onInit() {
    super.onInit();
    time = DateTime.now();
    dateTimeString.value = "${time.year}年${time.month}月${time.day}日 ${time.hour}：${time.minute}";
    upDateSolarTime();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSwitchValueChanged(bool value) {
    switchValue.value = value;
  }

  onSwitchSexValueChanged() {
    switchSexValue.value = !switchSexValue.value;
    // update();
  }

  void showDatePicker(context) {
    DatePicker.showDatePicker(
      context,
      onConfirm: (time, lunar) async {
        dateTimeString.value = "${time.year}年${time.month}月${time.day}日 ${time.hour}：${time.minute}";
        this.time = time;
        var data = {"FUNC":"BDayInfo","longitude":longitude,"latitude":latitude,"TZName":timeZone,"Year":time.year.toString(),"Month":time.month.toString(),"Day":time.day.toString(),"Hour":time.hour.toString(),"Min":time.minute.toString(),"Sec":time.second.toString()};
        solarTime.value = await SolarTime.getSolarTime(data);
        update();
      },
      onChanged: (time, lunar) {
        debugPrint("change:${time.toString()}");
      },
    );
  }

  Future<void> upDateSolarTime() async {
    var data = {"FUNC":"BDayInfo","longitude":longitude,"latitude":latitude,"TZName":timeZone,"Year":time.year.toString(),"Month":time.month.toString(),"Day":time.day.toString(),"Hour":time.hour.toString(),"Min":time.minute.toString(),"Sec":time.second.toString()};
    solarTime.value = await SolarTime.getSolarTime(data);
    update();
  }

}
