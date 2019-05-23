import '../models/item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'iprovider.dart';

class NewsDbProvider implements Cache, Source {
  Database db;
  
  NewsDbProvider(){
    _init();
  }

  _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
            CREATE TABLE Items
              (
                id INTEGER PRIMARY KEY,
                type TEXT,
                by TEXT,
                time integer,
                text TEXT,
                parent integer,
                kids BLOB,
                dead INTEGER, 
                deleted INTEGER,
                url TEXT,
                score INTEGER,
                title TEXT,
                descendants INTEGER)""");
    });
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id= ? ",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Item", item.toDbMap());
  }

  Future<List<int>> fetchTopIds() {
    return null;
  }
}

final newsDbProvider = NewsDbProvider();