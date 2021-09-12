class ExampleModel {
  final int id;
  final String name;
  final String description;

  ExampleModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
