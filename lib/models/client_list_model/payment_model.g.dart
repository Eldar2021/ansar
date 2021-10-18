// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentsAdapter extends TypeAdapter<Payments> {
  @override
  final int typeId = 6;

  @override
  Payments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Payments(
      id: fields[0] as int,
      userCreated: fields[1] as UserCrud,
      userUpdated: fields[2] as UserCrud,
      name: fields[3] as String,
      payments: fields[4] as String,
      createdAt: fields[5] as String,
      updatedAt: fields[6] as String,
      money: fields[7] as int,
      client: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Payments obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userCreated)
      ..writeByte(2)
      ..write(obj.userUpdated)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.payments)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.money)
      ..writeByte(8)
      ..write(obj.client);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
