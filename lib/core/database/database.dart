import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart'; // Archivo generado

// Definición de tabla
class Countries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get capital => text().withLength(min: 1, max: 50)();
  TextColumn get currency => text().withLength(min: 1, max: 50)();
  TextColumn get flag => text().withLength(min: 1, max: 50)();
  TextColumn get population => text().withLength(min: 1, max: 20)();
  TextColumn get area => text().withLength(min: 1, max: 20)();
}

// Definición de la base de datos
@DriftDatabase(tables: [Countries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.country'));
    return NativeDatabase(file);
  });
}
