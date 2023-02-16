class SourceModel {
  String? id;
  String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> data) {
    return SourceModel(
      id: data["id"],
      name: data["name"],
    );
  }
}
