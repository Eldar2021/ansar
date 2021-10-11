import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';

class Documents {
  int id;
  UserCrud userCreated;
  UserCrud userUpdated;
  String name;
  String documents;
  String createdAt;
  String updatedAt;
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
