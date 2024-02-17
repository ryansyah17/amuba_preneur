import 'package:get/get.dart';

import '../controllers/team_list_controller.dart';

class TeamListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamListController>(
      () => TeamListController(),
    );
  }
}
