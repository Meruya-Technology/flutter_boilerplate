import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';

class AppsFlyerUtil {
  static AppsflyerSdk initialization() {
    Map appsFlyerOptions = {
      "afDevKey": '8dGawcEXces2DLrEdZpuPV',
      "afAppId": 'com.meruyatechnology.flutter_boilerplate',
      "isDebug": true
    };
    final appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
    return appsflyerSdk;
  }

  static void listenDeeplink(AppsflyerSdk appsflyerSdk) {
    appsflyerSdk.onDeepLinking(
      (DeepLinkResult dp) {
        switch (dp.status) {
          case Status.FOUND:
            debugPrint(dp.deepLink?.toString());
            debugPrint("deep link value: ${dp.deepLink?.deepLinkValue}");
            break;
          case Status.NOT_FOUND:
            debugPrint("deep link not found");
            break;
          case Status.ERROR:
            debugPrint("deep link error: ${dp.error}");
            break;
          case Status.PARSE_ERROR:
            debugPrint("deep link status parsing error");
            break;
        }
      },
    );
  }
}
