import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/core/error_handler.dart';
import 'package:flutter_boilerplate/common/core/error_handler_impl.dart';
import 'package:flutter_boilerplate/domain/repositories/example_repository.dart';
import 'package:flutter_boilerplate/domain/usecases/retrieve_example.dart';
import 'package:flutter_boilerplate/infrastructure/datasources/example_datasource.dart';
import 'package:flutter_boilerplate/infrastructure/datasources/example_datasource_impl.dart';
import 'package:flutter_boilerplate/infrastructure/repositories/example_repository_impl.dart';

/// The idea of Facade is to segregate presentation layer with the domain layer
/// specificly to not using UseCase directly but still presentation can access
/// the usecase from Facade.
class ExampleFacade {
  /// Getter Section
  /// Due to separation between presentation and use case, the Facade doesn't
  /// require any constructor. Instead all of the dependencies is initiated
  /// and binding inside the Facade itself, The best approach is to create local
  /// getter class
  ErrorHandler get _errorHandler => ErrorHandlerImpl();
  ExampleDatasource get _exampleDatasource => ExampleDatasourceImpl();
  ExampleRepository get _exampleRepository => ExampleRepositoryImpl(
        datasource: _exampleDatasource,
      );

  /// Facade Methods
  /// Examples
  RetrieveExample retrieveExample(BuildContext context) => RetrieveExample(
        errorHandler: _errorHandler,
        repository: _exampleRepository,
      );
}
