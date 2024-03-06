
import 'dart:io';

import 'package:loginsignup/temp/blogs_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  static late Database _db;
  static Future<void> initialiseDatabase() async {
    Directory applicationDirectory = await getApplicationDocumentsDirectory();

    String databasePath = "${applicationDirectory.path}blogs.db";

    _db = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time INTEGER)');
    });
  }

  static Future<List<BlogsModel>> getDataFromDatabase() async {
    final result = await _db.query("Notes");

    List<BlogsModel> blogsModel =
        result.map((e) => BlogsModel.fromJson(e)).toList();

    return blogsModel;
  }

  static Future<void> insertData(BlogsModel model) async {
    final result = await _db.insert("Notes", model.toJson());

    print(result);
  }

  static Future<void> deleteDataFromDatabase(int time) async {
    final result =
        await _db.delete("Notes", where: "time = ?", whereArgs: [time]);

    print(result);
  }

  static Future<void> updateDataInDatabase(BlogsModel model, int time) async {
    final result = await _db
        .update("Notes", model.toJson(), where: "time = ?", whereArgs: [time]);

    print(result);
  }
}
