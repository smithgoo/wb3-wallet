import 'package:get/get.dart';

import 'controller.dart';

class ReciveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReciveController>(() => ReciveController());
  }
}
