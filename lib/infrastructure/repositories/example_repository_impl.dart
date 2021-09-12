import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/domain/entities/example.dart';
import 'package:flutter_boilerplate/domain/repositories/example_repository.dart';
import 'package:flutter_boilerplate/infrastructure/datasources/example_datasource.dart';
import 'package:flutter_boilerplate/infrastructure/mappers/example_mapper.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleDatasource datasource;
  ExampleRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Example> retrieveExample(BuildContext context) async {
    var model = await datasource.getExample(context);
    return ExampleMapper.toEntity(model);
  }
}
