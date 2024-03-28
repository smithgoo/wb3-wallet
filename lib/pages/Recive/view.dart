import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class RecivePage extends GetView<ReciveController> {
  const RecivePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReciveController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("recive")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
