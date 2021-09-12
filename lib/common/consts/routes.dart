import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/pages/example_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> indexs(
      BuildContext context) {
    return {
      ExamplePage.routeName: (context) => const ExamplePage(),
    };
  }
}
