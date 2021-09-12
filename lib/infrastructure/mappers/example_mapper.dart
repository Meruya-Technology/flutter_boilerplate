import 'package:flutter_boilerplate/domain/entities/example.dart';
import 'package:flutter_boilerplate/infrastructure/models/example_model.dart';

class ExampleMapper {
  static Example toEntity(ExampleModel model) => Example(
        id: model.id,
        name: model.name,
        description: model.description,
      );

  static ExampleModel toModel(Example entity) => ExampleModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
      );
}
