class CompanyModel {
  String name;
  String catchPhrase;
  String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> data) {
    return CompanyModel(
      name: data['name'],
      catchPhrase: data["catchPhrase"],
      bs: data["bs"],
    );
  }
}
