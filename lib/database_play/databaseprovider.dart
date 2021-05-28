import 'dart:io';

import 'package:challenge_1/database_play/datamodel/noteModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper db = DataBaseHelper._();

  static Database _database;

  Future<Database> get getDatabase async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Notes.db");

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE Notes("
            "id INTEGER PRIMARY KEY,"
            "title TEXT,"
            "description TEXT"
            ")");
      },
    );
  }

  insertNote(Note note) async {
    final db = await getDatabase;
    var result = await db.insert("Notes", note.toJson());
    return result;
  }

  Future<List<Note>> retriveData() async {
    final db = await getDatabase;

    List<Map> result = await db.query("Notes", orderBy: "id DESC");

    List<Note> noteslist = [];
    result.forEach((element) {
      Note note = Note.fromJson(element);
      noteslist.add(note);
    });
    return noteslist;
  }
}
