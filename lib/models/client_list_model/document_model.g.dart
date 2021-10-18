// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocumentsAdapter extends TypeAdapter<Documents> {
  @override
  final int typeId = 4;

  @override
  Documents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Documents(
      id: fields[0] as int,
      userCreated: fields[1] as UserCrud,
      userUpdated: fields[2] as UserCrud,
      name: fields[3] as String,
      documents: fields[4] as String,
      createdAt: fields[5] as String,
      updatedAt: fields[6] as String,
      client: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Documents obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userCreated)
      ..writeByte(2)
      ..write(obj.userUpdated)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.documents)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.client);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
