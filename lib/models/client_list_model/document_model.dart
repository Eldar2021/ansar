import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'document_model.g.dart';

@HiveType(typeId: 4)
class Documents {
  @HiveField(0)
  int id;
  @HiveField(1)
  UserCrud userCreated;
  @HiveField(2)
  UserCrud userUpdated;
  @HiveField(3)
  String name;
  @HiveField(4)
  String documents;
  @HiveField(5)
  String createdAt;
  @HiveField(6)
  String updatedAt;
  @HiveField(7)
  int client;

  Documents({
    required this.id,
    required this.userCreated,
    required this.userUpdated,
    required this.name,
    required this.documents,
    required this.createdAt,
    required this.updatedAt,
    required this.client,
  });

  factory Documents.fromJson(Map<String, dynamic> json) {
    return Documents(
      id: json['id'],
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      name: json['name'],
      documents: json['documents'],
      createdAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['created_at'])),
      updatedAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['updated_at'])),
      client: json['client'],
    );
  }
}
