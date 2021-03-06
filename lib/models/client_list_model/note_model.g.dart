// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesSetAdapter extends TypeAdapter<NotesSet> {
  @override
  final int typeId = 5;

  @override
  NotesSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesSet(
      id: fields[0] as int,
      userCreated: fields[1] as UserCrud,
      userUpdated: fields[2] as UserCrud,
      message: fields[3] as String,
      createdAt: fields[4] as String,
      updatedAt: fields[5] as String,
      client: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NotesSet obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userCreated)
      ..writeByte(2)
      ..write(obj.userUpdated)
      ..writeByte(3)
      ..write(obj.message)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.client);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesSetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
