import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  final controller = Get.put<WelcomeController>(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("")),
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  "Welcome to the decentralized wallet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                controller.state.hasBeenSetPwd
                    ? Column(children: [
                        TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: 'Input Password',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.makeSurePwd();
                          },
                          child: Text(
                            'Sure',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ])
                    : Column(children: [
                        Text(
                          "Password have not been set yet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.showPwdSetView(context);
                          },
                          child: Text(
                            'Set Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
