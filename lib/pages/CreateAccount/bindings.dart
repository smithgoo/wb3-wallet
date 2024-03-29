import 'package:get/get.dart';

import 'controller.dart';

class CreateaccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateaccountController>(() => CreateaccountController());
  }
}
