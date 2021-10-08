import 'package:ansar/models/model_for_client/city_model.dart';
import 'package:ansar/models/client_list_model/document_model.dart';
import 'package:ansar/models/client_list_model/note_model.dart';
import 'package:ansar/models/client_list_model/payment_model.dart';
import 'package:ansar/models/model_for_client/tariff_model.dart';
import 'package:ansar/models/model_for_client/user_crud.dart';

class ClientModel {
  int id;
  List<dynamic> documents;
  List<dynamic> notesSet;
  List<dynamic> payments;
  List<dynamic> questionnaires;
  CityModel city;
  TariffModel tariff;
  UserCrud userCreated;
  UserCrud userUpdated;
  String name;
  String lastName;
  String contractAt;
  String createdAt;
  String updatedAt;
  num totalMoney;
  String status;
  String endAt;
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
      documents: (json['documents'].map((e)=>Documents.fromJson(e)).toList()) ?? [],
      notesSet: json['notes_set'].map((e)=>NotesSet.fromJson(e)).toList() ?? [],
      payments: json['payments'].map((e)=>Payments.fromJson(e)).toList() ?? [],
      questionnaires: (json['questionnaires'].map((e)=>NotesSet.fromJson(e)).toList()) ?? [],
      city: CityModel.fromJson(json['city']),
      tariff: TariffModel.fromJson(json['tariff']),
      userCreated: UserCrud.fromJson(json['user_created']),
      userUpdated: UserCrud.fromJson(json['user_updated']),
      name: json['name'],
      lastName: json['last_name'],
      contractAt: json['contract_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      totalMoney: json['total_money'],
      status: json['status'],
      endAt: json['end_at'],
      firstPaymentsEndAt: json['first_payments_end_at'],
    );
  }
}
