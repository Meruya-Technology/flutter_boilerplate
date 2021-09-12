import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/consts/routes.dart';
import 'package:flutter_boilerplate/presentation/pages/example_page.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.indexs(context),
      initialRoute: ExamplePage.routeName,
    );
  }
}
