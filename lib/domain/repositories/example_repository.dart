import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/domain/entities/example.dart';

abstract class ExampleRepository {
  Future<Example> retrieveExample(BuildContext context);
}
