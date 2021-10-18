import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 5)
class NotesSet {
  @HiveField(0)
  int id;
  @HiveField(1)
  UserCrud userCreated;
  @HiveField(2)
  UserCrud userUpdated;
  @HiveField(3)
  String message;
  @HiveField(4)
  String createdAt;
  @HiveField(5)
  String updatedAt;
  @HiveField(6)
  int client;

  NotesSet({
    required this.id,
    required this.userCreated,
    required this.userUpdated,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.client,
  });

  factory NotesSet.fromJson(Map<String, dynamic> json) {
    return NotesSet(
      id: json['id'],
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      message: json['message'],
      createdAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['created_at'])),
      updatedAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['updated_at'])),
      client: json['client'],
    );
  }
}
