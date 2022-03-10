import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/core/error_handler.dart';
import 'package:flutter_boilerplate/common/core/use_case.dart';
import 'package:flutter_boilerplate/domain/entities/example.dart';
import 'package:flutter_boilerplate/domain/repositories/example_repository.dart';

class RetrieveExample extends UseCase<Example, BuildContext> {
  final ErrorHandler _errorHandler;
  final ExampleRepository _repository;

  RetrieveExample({
    required ErrorHandler errorHandler,
    required ExampleRepository repository,
  })  : _errorHandler = errorHandler,
        _repository = repository;

  @override
  Future<Example> build(BuildContext input) async {
    return await _repository.retrieveExample(input);
  }

  @override
  void onError(error) {}

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
