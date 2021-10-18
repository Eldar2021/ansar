import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'city_model.g.dart';

@HiveType(typeId: 1)
class CityModel {
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
      createdAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['created_at'])),
      updatedAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['updated_at'])),
    );
  }
}
