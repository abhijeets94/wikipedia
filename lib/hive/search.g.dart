// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/search.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchModelAdapter extends TypeAdapter<SearchModel> {
  @override
  final int typeId = 0;

  @override
  SearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchModel(
      batchcomplete: fields[0] as String?,
      query: fields[1] as Query?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchModel obj) {
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
      other is SearchModelAdapter &&
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
      searchinfo: fields[0] as Searchinfo?,
      search: (fields[1] as List?)?.cast<Search>(),
    );
  }

  @override
  void write(BinaryWriter writer, Query obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.searchinfo)
      ..writeByte(1)
      ..write(obj.search);
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

class SearchinfoAdapter extends TypeAdapter<Searchinfo> {
  @override
  final int typeId = 2;

  @override
  Searchinfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Searchinfo(
      totalhits: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Searchinfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.totalhits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchinfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchAdapter extends TypeAdapter<Search> {
  @override
  final int typeId = 3;

  @override
  Search read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Search(
      ns: fields[0] as int?,
      title: fields[1] as String?,
      pageid: fields[2] as int?,
      size: fields[3] as int?,
      wordcount: fields[4] as int?,
      snippet: fields[5] as String?,
      timestamp: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Search obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.ns)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.pageid)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.wordcount)
      ..writeByte(5)
      ..write(obj.snippet)
      ..writeByte(6)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
