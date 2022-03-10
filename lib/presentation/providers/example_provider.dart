import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ExampleProvider extends ChangeNotifier {
  /// Constructor
  final BuildContext context;
  ExampleProvider({
    required this.context,
  });

  /// Initial variable
  final _receivePort = ReceivePort();
  final _streamController = StreamController<String>.broadcast();

  /// Dynamic variable
  static int _isolateCounter = 0;
  late Isolate _isolate;
  var _counter = 0;
  var _isolateStatus = false;

  /// Getter
  int get counter => _counter;
  bool get isolateStatus => _isolateStatus;
  StreamController<String> get streamController => _streamController;
  Stream get stream => _streamController.stream;

  /// Method
  void count() {
    _counter++;
    notifyListeners();
  }

  Future<void> startIsolate() async {
    _isolate = await Isolate.spawn(_checkTimer, _receivePort.sendPort);
    _receivePort.listen(_handleMessage, onDone: () {
      developer.log(
        'listen is done',
        name: 'Event : End listening',
      );
    });
    _isolateStatus = true;
    notifyListeners();
  }

  static void _checkTimer(SendPort sendPort) async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      _isolateCounter++;
      String msg = 'counter ' + _isolateCounter.toString();
      sendPort.send(msg);
    });
  }

  void _handleMessage(dynamic data) {
    var message = 'Message is $data \n';
    _streamController.add(message);
    notifyListeners();
  }

  void stopIsolate() {
    _isolateStatus = false;
    _receivePort.close();
    _isolate.kill(priority: Isolate.immediate);
    notifyListeners();
  }
}
