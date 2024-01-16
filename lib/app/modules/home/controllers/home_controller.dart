import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/common/getSolarTime.dart';
import '../../../common/datepicker/flutter_lunar_datetime_picker.dart';
import '../views/home_view.dart';

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

  PageController pageController = PageController();
  GlobalKey<GifState> globalKey = GlobalKey();
  List<String> NUMBERS = ["零","壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"];

  //1 八字 2 紫薇 3 六爻
  int panType = 1;

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
        // solarTime.value = await SolarTime.getSolarTime(data);
        solarTime.value = SolarTime.getSolarTime(time,double.parse(longitude.value),double.parse(latitude.value)).toString();
        update();
      },
      onChanged: (time, lunar) {
        debugPrint("change:${time.toString()}");
      },
    );
  }

  upDateSolarTime() {
    solarTime.value = SolarTime.getSolarTime(time,double.parse(longitude.value),double.parse(latitude.value)).toString();
    update();
  }

}
