import 'package:get/get.dart';

class BookController extends GetxController {

  //山 1 医 2 命理 3 相 4 卜 5
  var switchValue = 1.obs;

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

  onSwitchValueChanged(value) {
    switchValue.value = value;
  }

}
