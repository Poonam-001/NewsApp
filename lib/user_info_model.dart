import 'package:news_app/address_model.dart';
import 'package:news_app/company_model.dart';

class UserInfoModel {
  int id;
  String name;
  String username;
  String email;
  AddressModel address;
  String phone;
  String website;
  CompanyModel company;

  UserInfoModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> data) {
    return UserInfoModel(
      id: data["id"],
      name: data["name"],
      username: data["username"],
      email: data["email"],
      address: AddressModel.fromJson(data["address"]),
      phone: data["phone"],
      website: data["website"],
      company: CompanyModel.fromJson(data["company"]),
    );
  }
}
