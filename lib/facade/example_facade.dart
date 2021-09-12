import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/core/error_handler.dart';
import 'package:flutter_boilerplate/domain/repositories/example_repository.dart';
import 'package:flutter_boilerplate/domain/usecases/retrieve_example.dart';

class ExampleFacade {
  final ErrorHandler _errorHandler;
  final ExampleRepository _exampleRepository;
  ExampleFacade({
    required ErrorHandler errorHandler,
    required ExampleRepository exampleRepository,
  })  : _errorHandler = errorHandler,
        _exampleRepository = exampleRepository;

  RetrieveExample retrieveExample(BuildContext context) => RetrieveExample(
        errorHandler: _errorHandler,
        repository: _exampleRepository,
      );
}
