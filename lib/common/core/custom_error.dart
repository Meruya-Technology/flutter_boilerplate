import 'package:flutter_boilerplate/common/core/error_handler.dart';

class CustomError implements ErrorHandler {
  @override
  formatError(error) {
    throw UnimplementedError();
  }
}
