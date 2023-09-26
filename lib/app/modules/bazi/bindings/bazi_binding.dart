import 'package:get/get.dart';

import '../controllers/bazi_controller.dart';

class BaziBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaziController>(
      () => BaziController(),
    );
  }
}
