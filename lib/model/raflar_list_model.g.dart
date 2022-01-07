// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raflar_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RaflarAdapter extends TypeAdapter<Raflar> {
  @override
  final int typeId = 0;

  @override
  Raflar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Raflar(
      rafAdi: fields[0] as String,
      kitapAdet: fields[1] as int,
      okunduMu: fields[2] as bool,
      rafKitaplar: [], rafId: 0,
    );
  }

  @override
  void write(BinaryWriter writer, Raflar obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.rafAdi)
      ..writeByte(1)
      ..write(obj.kitapAdet)
      ..writeByte(2)
      ..write(obj.okunduMu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaflarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
