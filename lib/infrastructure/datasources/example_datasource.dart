import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/infrastructure/models/example_model.dart';

abstract class ExampleDatasource {
  Future<ExampleModel> getExample(BuildContext context);
}
