import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hiepnx/models/card.dart';
import 'package:hiepnx/models/category.dart';
import 'package:hiepnx/models/choice.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteRepository {
  factory SqfliteRepository() {
    if (_this == null) _this = SqfliteRepository._getInstance();
    return _this;
  }

  static SqfliteRepository _this;

  SqfliteRepository._getInstance();

  Database _db;
  Database _userDb;
  String dbName = 'data.db';
  String userDbName = 'user_data.db';

  Future initDb() async {
    await _checkAndCopyDatabase(dbName);
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    String pathUserDb = join(documentsDirectory.path, userDbName);
    _db = await openDatabase(path);
    _userDb = await openDatabase(pathUserDb);

    await _createTable(_db);
    await _createUserDbTable(_userDb);
    return _db;
  }

  Future<void> _checkAndCopyDatabase(String dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    print("pathxxx: $path");
    // Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      // Load database from asset and copy
      // print("dbName not found $dbName documentsDirectory.path: ${documentsDirectory.path}");
      ByteData data = await rootBundle.load(join('assets', dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
      //  print("dbName $dbName copy successs documentsDirectory.path: ${documentsDirectory.path}");
    } else {
      // print("dbName found $dbName documentsDirectory.path: ${documentsDirectory.path}");
    }
  }

  Future<void> _createTable(db) async {
    await db.execute(createCardTable);
    await db.execute(createChoiceTable);
    // await db.execute(createCategoryTable);
    await test();
  }
  
  Future<void> _createUserDbTable(db) async {
  }

  Future<Card> test() async {
    String sql = "select * from $tableCard";
    List<Map> maps = await _db.rawQuery(sql);
    Card card;
    print("test ${maps.length}; sql = $sql");
    if(maps.isNotEmpty){
      card = Card.fromMap(maps[0]);
      print("xxxxx $card");
    }
    return card;
  } 
}
