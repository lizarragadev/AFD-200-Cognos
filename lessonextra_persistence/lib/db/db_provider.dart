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
    
  }

  
}