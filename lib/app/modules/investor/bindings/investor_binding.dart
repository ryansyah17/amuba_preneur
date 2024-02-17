import 'package:get/get.dart';

import '../controllers/investor_controller.dart';

class InvestorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorController>(
      () => InvestorController(),
    );
  }
}
