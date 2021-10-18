// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientModelAdapter extends TypeAdapter<ClientModel> {
  @override
  final int typeId = 0;

  @override
  ClientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientModel(
      id: fields[0] as int,
      documents: (fields[1] as List).cast<dynamic>(),
      notesSet: (fields[2] as List).cast<dynamic>(),
      payments: (fields[3] as List).cast<dynamic>(),
      questionnaires: (fields[4] as List).cast<dynamic>(),
      city: fields[5] as CityModel,
      tariff: fields[6] as TariffModel,
      userCreated: fields[7] as UserCrud,
      userUpdated: fields[8] as UserCrud,
      name: fields[9] as String,
      lastName: fields[10] as String,
      contractAt: fields[11] as String,
      createdAt: fields[12] as String,
      updatedAt: fields[13] as String,
      totalMoney: fields[14] as num,
      status: fields[15] as String,
      endAt: fields[16] as String,
      firstPaymentsEndAt: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ClientModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.documents)
      ..writeByte(2)
      ..write(obj.notesSet)
      ..writeByte(3)
      ..write(obj.payments)
      ..writeByte(4)
      ..write(obj.questionnaires)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.tariff)
      ..writeByte(7)
      ..write(obj.userCreated)
      ..writeByte(8)
      ..write(obj.userUpdated)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.lastName)
      ..writeByte(11)
      ..write(obj.contractAt)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.totalMoney)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.endAt)
      ..writeByte(17)
      ..write(obj.firstPaymentsEndAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
