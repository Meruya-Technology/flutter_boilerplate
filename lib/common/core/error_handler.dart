import 'custom_error.dart';

abstract class ErrorHandler {
  CustomError formatError(dynamic error);
}
