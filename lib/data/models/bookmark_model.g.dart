// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkModelAdapter extends TypeAdapter<BookmarkModel> {
  @override
  final int typeId = 0;

  @override
  BookmarkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      imageUrl: fields[3] as String,
      sourceName: fields[4] as String,
      category: fields[5] as String,
      author: fields[6] as String,
      url: fields[7] as String,
      publishedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.sourceName)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(8)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
