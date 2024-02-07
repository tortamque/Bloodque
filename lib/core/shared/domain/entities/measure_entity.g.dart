// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasureEntityAdapter extends TypeAdapter<MeasureEntity> {
  @override
  final int typeId = 1;

  @override
  MeasureEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasureEntity(
      systolic: fields[0] as int,
      diastolic: fields[1] as int,
      pulse: fields[2] as int,
      time: fields[3] as TimeOfDay,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MeasureEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.systolic)
      ..writeByte(1)
      ..write(obj.diastolic)
      ..writeByte(2)
      ..write(obj.pulse)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasureEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
