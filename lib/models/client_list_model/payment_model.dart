import 'package:ansar/models/model_for_client/user_crud.dart';

class Payments {
  int id;
  UserCrud userCreated;
  UserCrud userUpdated;
  String name;
  String payments;
  String createdAt;
  String updatedAt;
  int money;
  int client;

  Payments({
    required this.id,
    required this.userCreated,
    required this.userUpdated,
    required this.name,
    required this.payments,
    required this.createdAt,
    required this.updatedAt,
    required this.money,
    required this.client,
  });

  factory Payments.fromJson(Map<String, dynamic> json) {
    return Payments(
      id: json['id'],
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      name: json['name'],
      payments: json['payments'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      money: json['money'],
      client: json['client'],
    );
  }
}