import 'package:ansar/models/model_for_client/city_model.dart';
import 'package:ansar/models/client_list_model/document_model.dart';
import 'package:ansar/models/client_list_model/note_model.dart';
import 'package:ansar/models/client_list_model/payment_model.dart';
import 'package:ansar/models/model_for_client/tariff_model.dart';
import 'package:ansar/models/model_for_client/user_crud.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'client_model.g.dart';

@HiveType(typeId: 0)
class ClientModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  List<dynamic> documents;
  @HiveField(2)
  List<dynamic> notesSet;
  @HiveField(3)
  List<dynamic> payments;
  @HiveField(4)
  List<dynamic> questionnaires;
  @HiveField(5)
  CityModel city;
  @HiveField(6)
  TariffModel tariff;
  @HiveField(7)
  UserCrud userCreated;
  @HiveField(8)
  UserCrud userUpdated;
  @HiveField(9)
  String name;
  @HiveField(10)
  String lastName;
  @HiveField(11)
  String contractAt;
  @HiveField(12)
  String createdAt;
  @HiveField(13)
  String updatedAt;
  @HiveField(14)
  num totalMoney;
  @HiveField(15)
  String status;
  @HiveField(16)
  String endAt;
  @HiveField(17)
  String firstPaymentsEndAt;

  ClientModel({
    required this.id,
    required this.documents,
    required this.notesSet,
    required this.payments,
    required this.questionnaires,
    required this.city,
    required this.tariff,
    required this.userCreated,
    required this.userUpdated,
    required this.name,
    required this.lastName,
    required this.contractAt,
    required this.createdAt,
    required this.updatedAt,
    required this.totalMoney,
    required this.status,
    required this.endAt,
    required this.firstPaymentsEndAt,
  });

  final List<String> document = [];

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      documents: (json['documents'].map((e) => Documents.fromJson(e)).toList()) ?? [],
      notesSet: json['notes_set'].map((e) => NotesSet.fromJson(e)).toList() ?? [],
      payments: json['payments'].map((e) => Payments.fromJson(e)).toList() ?? [],
      questionnaires: (json['questionnaires'].map((e) => NotesSet.fromJson(e)).toList()) ?? [],
      city: CityModel.fromJson(json['city']),
      tariff: TariffModel.fromJson(json['tariff']),
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      name: json['name'],
      lastName: json['last_name'],
      contractAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['contract_at'])),
      createdAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['created_at'])),
      updatedAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['updated_at'])),
      totalMoney: json['total_money'],
      status: json['status'],
      endAt: DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['end_at'])),
      firstPaymentsEndAt:
          DateFormat('dd/MM/yyy kk:mm').format(DateTime.parse(json['first_payments_end_at'])),
    );
  }
}
