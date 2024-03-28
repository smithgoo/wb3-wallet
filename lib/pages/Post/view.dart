import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PostPage extends GetView<PostController> {
  const PostPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("post")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
