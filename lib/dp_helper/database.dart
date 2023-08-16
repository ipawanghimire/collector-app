import 'package:flutter/src/widgets/framework.dart';
import 'package:hoeizon_app/model/collection_model.dart';
import 'package:hoeizon_app/provider/provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('collector.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'REAL NOT NULL';

    await db.execute('''
      CREATE TABLE collector (
        id $idType,
        accountNumber $textType,
        accountName $textType,
        amount $doubleType,
        type $textType
      )
    ''');
  }

  Future<int> insertDeposit(Collection collection) async {
    final db = await instance.database;
    return await db.insert('collector', collection.toMap());
  }

  Future<List<Collection>> getAllCollections() async {
    final db = await instance.database;
    final maps = await db.query('collector');

    return List.generate(maps.length, (i) {
      return Collection(
        id: maps[i]['id'] as int, // Cast to int
        accountNumber: maps[i]['accountNumber'] as String,
        accountName: maps[i]['accountName'] as String,
        amount: maps[i]['amount'] as double, // Cast to double
        type: maps[i]['type'] as String,
      );
    });
  }

  Future<void> resetTable(BuildContext context) async {
    final db = await instance.database;
    final result = await db.delete('collector');

    final collectionProvider =
        Provider.of<CollectionProvider>(context, listen: false);
    collectionProvider.resetTotalDeposit();
  }
}
