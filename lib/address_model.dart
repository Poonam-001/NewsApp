import 'package:news_app/geo_model.dart';

class AddressModel {
  String street;
  String suite;
  String city;
  String zipcode;
  GeoModel geo;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> data) {
    return AddressModel(
      street: data["street"],
      suite: data["suite"],
      city: data["city"],
      zipcode: data["zipcode"],
      geo: GeoModel.fromJson(data["geo"]),
    );
  }
}
