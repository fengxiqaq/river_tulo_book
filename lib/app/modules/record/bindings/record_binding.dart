import 'package:get/get.dart';

import '../controllers/record_controller.dart';

class RecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordController>(
      () => RecordController(),
    );
  }
}
