import 'package:get/get.dart';

import '../controllers/deal_controller.dart';

class DealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DealController>(
      () => DealController(),
    );
  }
}
