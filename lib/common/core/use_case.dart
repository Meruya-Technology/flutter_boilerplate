import 'error_handler.dart';

abstract class UseCase<O, I> {
  Future<O> build(I input);

  ErrorHandler errorHandler();

  Future<O> execute(I input) {
    return build(input).catchError((error) {
      onError(error);
      throw errorHandler().formatError(error);
    });
  }

  void onError(dynamic error) {}
}
