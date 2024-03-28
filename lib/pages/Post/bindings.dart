import 'package:get/get.dart';

import 'controller.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
  }
}
