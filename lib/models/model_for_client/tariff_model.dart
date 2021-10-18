import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'tariff_model.g.dart';

@HiveType(typeId: 2)
class TariffModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  UserCrud userCreated;
  @HiveField(2)
  UserCrud userUpdated;
  @HiveField(3)
  String name;
  @HiveField(4)
  String createdAt;
  @HiveField(5)
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
      createdAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['created_at'])),
      updatedAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['updated_at'])),
    );
  }
}
