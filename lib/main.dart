import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web3_wallet/common/utils/logger.dart';
import 'package:web3_wallet/global.dart';

import 'common/langs/translation_service.dart';
import 'common/routers/pages.dart';
import 'common/store/config.dart';
import 'common/style/theme.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 960),
      builder: (context, child) => GetMaterialApp(
        title: 'Wallet_Crypto',
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        builder: EasyLoading.init(),
        translations: TranslationService(),
        navigatorObservers: [AppPages.observer],
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        supportedLocales: ConfigStore.to.languages,
        locale: ConfigStore.to.locale,
        fallbackLocale: const Locale('en', 'US'),
        enableLog: true,
        logWriterCallback: Logger.write,
      ),
    );
  }
}
