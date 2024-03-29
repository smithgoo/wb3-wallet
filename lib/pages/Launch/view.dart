import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web3_wallet/common/routers/names.dart';

import 'index.dart';

class LaunchPage extends GetView<LaunchController> {
  final controller = Get.put<LaunchController>(LaunchController());
  int _currentPage = 0;

  Widget BannerItem(color, title) {
    return Container(
      width: ScreenUtil().setWidth(720),
      margin: const EdgeInsets.all(8.0),
      // color: color,
      child: Center(
          child: Column(
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            color: Colors.red,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaunchController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.blue[400],
          appBar: AppBar(
            title: const Text(""),
            backgroundColor: Colors.blue[400],
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 150.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: ScreenUtil().setWidth(400),
                  child: PageView(
                    controller: controller.pageController,
                    children: <Widget>[
                      BannerItem(Colors.red, "Welcome to WB3 Wallet"),
                      BannerItem(Colors.red, "Welcome to WB3 Wallet1"),
                      BannerItem(Colors.red, "Welcome to WB3 Wallet2"),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    Get.toNamed(AppRoutes.CREATEACCOUNT);
                  },
                  child: const Text(
                    "Create An Account",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    Get.toNamed(AppRoutes.LOGIN);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
