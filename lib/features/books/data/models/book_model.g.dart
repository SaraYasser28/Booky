// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 0;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      id: fields[0] as String,
      title: fields[1] as String,
      author: fields[2] as String,
      imagePath: fields[3] as String,
      genre: fields[4] as String,
      rating: fields[5] as double,
      available: fields[6] as bool,
      notes: fields[7] as String,
      publishedDate: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.genre)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.available)
      ..writeByte(7)
      ..write(obj.notes)
      ..writeByte(8)
      ..write(obj.publishedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
