import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/utils/apps_flyer_util.dart';
import 'package:flutter_boilerplate/common/utils/route_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appsflyerUtil = AppsFlyerUtil.initialization();
  AppsFlyerUtil.listenDeeplink(appsflyerUtil);
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    /// Dependencies injection
    var _routeUtil = routeUtil(context);

    return MaterialApp(
      title: 'Flutter Boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _routeUtil.routes,
      initialRoute: _routeUtil.initialRoute,
    );
  }

  RouteUtil routeUtil(BuildContext context) => RouteUtil(context: context);
}
