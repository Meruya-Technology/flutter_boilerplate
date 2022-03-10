import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/pages/example_page.dart';

class RouteUtil {
  final BuildContext context;

  RouteUtil({
    required this.context,
  });

  String get initialRoute => ExamplePage.routeName;

  Map<String, Widget Function(BuildContext)> get routes => {
        ExamplePage.routeName: (context) => const ExamplePage(),
      };
}
