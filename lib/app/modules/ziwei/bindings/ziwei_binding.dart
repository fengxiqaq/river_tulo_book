import 'package:get/get.dart';

import '../controllers/ziwei_controller.dart';

class ZiweiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZiweiController>(
      () => ZiweiController(),
    );
  }
}
