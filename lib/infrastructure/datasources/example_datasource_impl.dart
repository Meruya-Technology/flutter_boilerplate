import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/consts/jsons.dart';
import 'package:flutter_boilerplate/infrastructure/models/example_model.dart';
import 'package:flutter_boilerplate/infrastructure/models/example_response_model.dart';

import 'example_datasource.dart';

class ExampleDatasourceImpl implements ExampleDatasource {
  @override
  Future<ExampleModel> getExample(BuildContext context) async {
    var jsonString = await DefaultAssetBundle.of(context).loadString(
      exampleJson,
    );
    var decodedJson = jsonDecode(jsonString);
    var model = ExampleResponseModel.fromJson(decodedJson);
    return model.data;
  }
}
