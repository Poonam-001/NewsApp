class GeoModel {
  String lat;
  String lng;

  GeoModel({
    required this.lat,
    required this.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> data) {
    return GeoModel(
      lat: data["lat"],
      lng: data["lng"],
    );
  }
}
