import 'package:flutter/material.dart';
import 'package:web3_wallet/common/middlewares/middlewares.dart';
import 'package:web3_wallet/pages/CreateAccount/index.dart';
import 'package:web3_wallet/pages/Home/bindings.dart';
import 'package:web3_wallet/pages/Home/view.dart';
import 'package:get/get.dart';
import 'package:web3_wallet/pages/Launch/index.dart';
import 'package:web3_wallet/pages/Launch/view.dart';
import 'package:web3_wallet/pages/Welcome/index.dart';

import 'routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // GetPage(
    //   name: AppRoutes.INITIAL,
    //   page: () => WelcomePage(),
    //   binding: WelcomeBinding(),
    // ),

    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => LaunchPage(),
      binding: LaunchBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATEACCOUNT,
      page: () => CreateaccountPage(),
      binding: CreateaccountBinding(),
    ),

    //
    // // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 0),
    //   ],
    // ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );
}
