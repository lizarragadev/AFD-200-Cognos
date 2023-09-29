import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const tableCategory = 'category';
  static const tableContact = 'contact';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnLName = 'lname';
  static const columnMobile = 'mobile';
  static const columnEmail = 'email';
  static const columnCategory = 'cat';
  static const columnProfile = 'profile';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database?> get database1 async {
    _database ??= await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE $tableCategory (
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL
        )
      '''
    );
    await db.execute(
      '''
        CREATE TABLE $tableContact (
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
          $columnLName TEXT NOT NULL,
          $columnMobile TEXT NOT NULL,
          $columnEmail TEXT NOT NULL,
          $columnCategory TEXT NOT NULL,
          $columnProfile TEXT NOT NULL
        )
      ''');
  }

  Future<int> insertCategory(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableCategory, row);
  }

  Future<int> insertContact(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableContact, row);
  }

  Future<int> upadate(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(tableContact, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteCategory(int id) async {
    Database db = await instance.database;
    return await db.delete(tableCategory, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteContact(int id) async {
    Database db = await instance.database;
    return await db.delete(tableContact, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllCategory() async {
    Database db = await instance.database;
    return await db.query(tableCategory);
  }
  
  Future<List<Map<String, dynamic>>> queryAllContacts() async {
    Database db = await instance.database;
    return await db.query(tableContact);
  }
}