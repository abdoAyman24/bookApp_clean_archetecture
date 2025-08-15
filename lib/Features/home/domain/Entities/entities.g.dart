// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntitiesBooksAdapter extends TypeAdapter<EntitiesBooks> {
  @override
  final int typeId = 0;

  @override
  EntitiesBooks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntitiesBooks(
      bookId: fields[0] as String,
      image: fields[1] as String?,
      title: fields[2] as String?,
      author: fields[3] as String?,
      price: fields[4] as num,
      rate: fields[5] as num,
      number: fields[6] as num,
    );
  }

  @override
  void write(BinaryWriter writer, EntitiesBooks obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rate)
      ..writeByte(6)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntitiesBooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
