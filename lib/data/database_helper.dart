import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper _instance = DatabaseHelper._();
  static DatabaseHelper get instance => _instance;

  Future<Database> get _database async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");
    var exists = await databaseExists(path);

    if (!exists) {
      debugPrint("Creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        debugPrint("error: $e");
      }
      ByteData data =
          await rootBundle.load(join("assets", "oil_helper_database.db"));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      debugPrint("Opening existing database");
    }
    return openDatabase(path);
  }

  Future<List<Map<String, Object?>>> getCarsList() async {
    final db = await instance._database;
    return db.rawQuery('SELECT DISTINCT fuelType FROM car');
  }

  Future<List<Map<String, Object?>>> getCarsListByFuelType(
      String fuelType) async {
    final db = await instance._database;
    return db.rawQuery(
        'SELECT DISTINCT manufacturer FROM car WHERE fuelType=?', [fuelType]);
  }

  Future<List<Map<String, Object?>>> getCarsListByManufacturer(
      String fuelType, String manufacturer) async {
    final db = await instance._database;
    return db.rawQuery(
      'SELECT DISTINCT model FROM car WHERE fuelType=? AND manufacturer=?',
      [
        fuelType,
        manufacturer,
      ],
    );
  }

  Future<List<Map<String, Object?>>> getCarsListByModel(
      String fuelType, String manufacturer, String model) async {
    final db = await instance._database;
    return db.rawQuery(
      'SELECT DISTINCT engineType FROM car WHERE fuelType=? AND manufacturer=? AND model=?',
      [fuelType, manufacturer, model],
    );
  }

  Future<List<Map<String, Object?>>> getCarsListByEngineType(String fuelType,
      String manufacturer, String model, String engineType) async {
    final db = await instance._database;
    return db.rawQuery(
      'SELECT DISTINCT * FROM car WHERE fuelType=? AND manufacturer=? AND model=? AND engineType=?',
      [fuelType, manufacturer, model, engineType],
    );
  }

  Future<List<Map<String, Object?>>> getLukoilLube(int lubeID) async {
    final db = await instance._database;
    return db.rawQuery('SELECT * FROM lukoilLube WHERE lubeID=?', [lubeID]);
  }

  Future<List<Map<String, Object?>>> getGazpromLube(int lubeID) async {
    final db = await instance._database;
    return db.rawQuery('SELECT * FROM gazpromLube WHERE lubeID=?', [lubeID]);
  }

  Future<List<Map<String, Object?>>> getRosneftLube(int lubeID) async {
    final db = await instance._database;
    return db.rawQuery('SELECT * FROM rosneftLube WHERE lubeID=?', [lubeID]);
  }

  Future<List<Map<String, Object?>>> getFaqList(Locale locale) async {
    final db = await instance._database;
    if (locale.languageCode == 'ru') {
      return db.rawQuery('SELECT * FROM faq_ru');
    } else {
      return db.rawQuery('SELECT * FROM faq');
    }
  }

  Future<List<Map<String, Object?>>> getFaqAnswer(int id, Locale locale) async {
    final db = await instance._database;
    if (locale.languageCode == 'ru') {
      return db.rawQuery('SELECT * FROM faq_ru WHERE faqID=?', [id]);
    } else {
      return db.rawQuery('SELECT * FROM faq WHERE faqID=?', [id]);
    }
  }

  Future<List<Map<String, Object?>>> getRequestsList() async {
    final db = await instance._database;
    return db.rawQuery('SELECT * FROM request');
  }

  Future<int> addRequest(String fuelType, String manufacturer, String model,
      String engineType, String date) async {
    final db = await instance._database;
    return db.rawInsert(
        'INSERT INTO request(fuelType, manufacturer, model, engineType, date) VALUES ("$fuelType", "$manufacturer", "$model", "$engineType", "$date")');
  }
}
