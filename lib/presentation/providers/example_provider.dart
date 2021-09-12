import 'package:flutter/material.dart';

class ExampleProvider extends ChangeNotifier {
  /// Constructor
  final BuildContext context;
  ExampleProvider({
    required this.context,
  });

  /// Initial variable
  final _pageTitle = 'Example';

  /// Dynamic variable
  var _counter = 0;

  /// Getter
  String get pageTitle => _pageTitle;
  int get counter => _counter;

  /// Method
  void count() {
    _counter++;
  }
}
