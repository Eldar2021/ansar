// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_crud.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCrudAdapter extends TypeAdapter<UserCrud> {
  @override
  final int typeId = 3;

  @override
  UserCrud read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCrud(
      username: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserCrud obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCrudAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
