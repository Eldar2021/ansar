import 'package:ansar/models/model_for_client/user_crud.dart';

class CityModel {
  int id;
  UserCrud userCreated;
  UserCrud userUpdated;
  String name;
  String createdAt;
  String updatedAt;

  CityModel({
    required this.id,
    required this.userCreated,
    required this.userUpdated,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}