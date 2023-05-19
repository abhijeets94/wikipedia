// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsModelAdapter extends TypeAdapter<DetailsModel> {
  @override
  final int typeId = 0;

  @override
  DetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsModel(
      batchcomplete: fields[0] as bool?,
      query: fields[1] as Query?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.batchcomplete)
      ..writeByte(1)
      ..write(obj.query);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QueryAdapter extends TypeAdapter<Query> {
  @override
  final int typeId = 1;

  @override
  Query read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Query(
      pages: (fields[0] as List?)?.cast<Pages>(),
    );
  }

  @override
  void write(BinaryWriter writer, Query obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PagesAdapter extends TypeAdapter<Pages> {
  @override
  final int typeId = 2;

  @override
  Pages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pages(
      pageid: fields[0] as int?,
      ns: fields[1] as int?,
      title: fields[2] as String?,
      revisions: (fields[3] as List?)?.cast<Revisions>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pages obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pageid)
      ..writeByte(1)
      ..write(obj.ns)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.revisions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RevisionsAdapter extends TypeAdapter<Revisions> {
  @override
  final int typeId = 3;

  @override
  Revisions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Revisions(
      slots: fields[0] as Slots?,
    );
  }

  @override
  void write(BinaryWriter writer, Revisions obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.slots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevisionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SlotsAdapter extends TypeAdapter<Slots> {
  @override
  final int typeId = 4;

  @override
  Slots read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Slots(
      main: fields[0] as Main?,
    );
  }

  @override
  void write(BinaryWriter writer, Slots obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.main);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlotsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainAdapter extends TypeAdapter<Main> {
  @override
  final int typeId = 5;

  @override
  Main read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Main(
      contentmodel: fields[0] as String?,
      contentformat: fields[1] as String?,
      content: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Main obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.contentmodel)
      ..writeByte(1)
      ..write(obj.contentformat)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
