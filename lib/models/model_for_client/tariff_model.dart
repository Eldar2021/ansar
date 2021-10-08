import 'package:ansar/models/model_for_client/user_crud.dart';

class TariffModel {
  int id;
  UserCrud userCreated;
  UserCrud userUpdated;
  String name;
  String createdAt;
  String updatedAt;

  TariffModel({
    required this.id,
    required this.userCreated,
    required this.userUpdated,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) {
    return TariffModel(
      id: json['id'],
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}