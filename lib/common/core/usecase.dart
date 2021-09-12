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

  // Make this empty body so that use case that doesn't need this callback
  // doesn't have to override
  void onError(dynamic error) {}
}
