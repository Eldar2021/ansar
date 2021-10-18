import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'payment_model.g.dart';

@HiveType(typeId: 6)
class Payments {
  @HiveField(0)
  int id;
  @HiveField(1)
  UserCrud userCreated;
  @HiveField(2)
  UserCrud userUpdated;
  @HiveField(3)
  String name;
  @HiveField(4)
  String payments;
  @HiveField(5)
  String createdAt;
  @HiveField(6)
  String updatedAt;
  @HiveField(7)
  int money;
  @HiveField(8)
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
      createdAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['created_at'])),
      updatedAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['updated_at'])),
      money: json['money'],
      client: json['client'],
    );
  }
}
