// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DestinationCMAdapter extends TypeAdapter<DestinationCM> {
  @override
  final int typeId = 0;

  @override
  DestinationCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DestinationCM(
      name: fields[0] as String,
      description: fields[1] as String,
      price: fields[2] as int,
      rating: fields[3] as double,
      imagePath: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DestinationCM obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
