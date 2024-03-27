import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  final controller = Get.put<HomeController>(HomeController());

  Widget _buttonClick(title, idx, callBack) {
    return TextButton(
      onPressed: () {
        callBack(idx);
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("home")),
          body: SafeArea(
            child: Column(
              children: [
                _buttonClick("生成助记词", 1, (idx) {
                  controller.btnClickWithType(idx);
                }),
                _buttonClick("助记词生成账号信息", 2, (idx) {
                  controller.btnClickWithType(idx);
                }),
                _buttonClick("私钥生成账号信息", 3, (idx) {
                  controller.btnClickWithType(idx);
                }),
                _buttonClick("获取gas费用", 4, (idx) {
                  controller.btnClickWithType(idx);
                }),
                _buttonClick("获取余额", 5, (idx) {
                  controller.btnClickWithType(idx);
                }),
                _buttonClick("转账", 6, (idx) {
                  controller.btnClickWithType(idx);
                }),
                Obx(() => Text("助记词: ${controller.state.memonicWords}")),
                Obx(() => Text("地址: ${controller.state.address}")),
                Obx(() => Text("私钥: ${controller.state.privateKey}")),
                Obx(() => Text("余额: ${controller.state.balance}")),
                Obx(() => Text("gas费用: ${controller.state.gasPrice}")),
              ],
            ),
          ),
        );
      },
    );
  }
}
