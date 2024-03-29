import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class CreateaccountPage extends GetView<CreateaccountController> {
  final controller =
      Get.put<CreateaccountController>(CreateaccountController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateaccountController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.blue[400],
          appBar: AppBar(
            title: const Text(
              "Create An Account",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue[400],
          ),
          body: SafeArea(
            child: Container(),
          ),
        );
      },
    );
  }
}
