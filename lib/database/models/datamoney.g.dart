// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamoney.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataMoneyAdapter extends TypeAdapter<DataMoney> {
  @override
  final int typeId = 1;

  @override
  DataMoney read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataMoney(
      nametitular: fields[0] as String,
      dineromenos: fields[1] as String,
      saldoactual: fields[2] as String,
      fecha: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataMoney obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nametitular)
      ..writeByte(1)
      ..write(obj.dineromenos)
      ..writeByte(2)
      ..write(obj.saldoactual)
      ..writeByte(3)
      ..write(obj.fecha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMoneyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
