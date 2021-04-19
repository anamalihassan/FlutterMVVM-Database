import 'dart:async';
import 'dart:io';

import 'package:flutter_shortly/features/shorten/model/shorten_result.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ShortenDBProvider {

  ShortenDBProvider._();

  factory ShortenDBProvider() {
    return db;
  }

  static final ShortenDBProvider db = ShortenDBProvider._();

  String shorten_table_name = "SHORTEN_URL";

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ${shorten_table_name} ("
          "id INTEGER PRIMARY KEY,"
          "code TEXT,"
          "short_link TEXT,"
          "full_short_link TEXT,"
          "short_link2 TEXT,"
          "full_short_link2 TEXT,"
          "short_link3 TEXT,"
          "full_short_link3 TEXT,"
          "share_link TEXT,"
          "full_share_link TEXT,"
          "original_link TEXT"
          ")");
    });
  }

  insertShortenURL(ShortenResult shortenResult) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM ${shorten_table_name}");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into ${shorten_table_name} (id,code,short_link,full_short_link,short_link2,full_short_link2,short_link3,full_short_link3,share_link,full_share_link,original_link)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?)",
        [id, shortenResult.code, shortenResult.short_link, shortenResult.full_short_link, shortenResult.short_link2, shortenResult.full_short_link2,
          shortenResult.short_link3, shortenResult.full_short_link3, shortenResult.share_link, shortenResult.full_share_link, shortenResult.original_link]);
    return raw;
  }

  updateShortenURL(ShortenResult shortenResult) async {
    final db = await database;
    var res = await db.update(shorten_table_name, shortenResult.toJson(),
        where: "id = ?", whereArgs: [shortenResult.id]);
    return res;
  }

  getShortenURL(int shorten_url_id) async {
    final db = await database;
    var res = await db.query(shorten_table_name, where: "id = ?", whereArgs: [shorten_url_id]);
    return res.isNotEmpty ? ShortenResult.fromJson(res.first) : null;
  }

  Future<List<ShortenResult>> getAllShortenURLs() async {
    final db = await database;
    var res = await db.query(shorten_table_name);
    List<ShortenResult> list =
        res.isNotEmpty ? res.map((c) => ShortenResult.fromJson(c)).toList() : [];
    return list;
  }

  deleteShortenURL(int shorten_url_id) async {
    final db = await database;
    return db.delete(shorten_table_name, where: "id = ?", whereArgs: [shorten_url_id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete from ${shorten_table_name}");
  }
}
