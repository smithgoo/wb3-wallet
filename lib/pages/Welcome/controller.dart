import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web3_wallet/common/routers/routes.dart';

import '../../alertStyle.dart';
import '../../common/services/storage.dart';
import 'index.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  TextEditingController passwordController = TextEditingController();
  final state = WelcomeState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    checkHasBeenSetPwd();
  }

  checkHasBeenSetPwd() async {
    var hasSetPwd = StorageService.to.getString("pwd");
    if (hasSetPwd.isNotEmpty) {
      state.hasBeenSetPwd = true;
    } else {
      state.hasBeenSetPwd = false;
    }
  }

  makeSurePwd() {
    var pwd = StorageService.to.getString("pwd");
    if (pwd == passwordController.text) {
      Get.offAndToNamed(AppRoutes.HOME);
    } else {
      AlertLocalStyle.showAlertError(
        null,
        "Error",
        "Passwords is incorrect",
      );
    }
  }

  showPwdSetView(context) {
    AlertLocalStyle.showPwdComparView(context, (pwd) async {
      var status = await StorageService.to.setString("pwd", pwd);
      Get.offAndToNamed(AppRoutes.HOME);
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
