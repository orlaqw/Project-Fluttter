import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        note TEXT,
        isCompleted INTEGER,
        imagePath TEXT
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'db.sqlite',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String title, String? descr, String? note, String? imagePath) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': descr, 'note': note, 'isCompleted': 0, 'imagePath': imagePath};
    final id = await db.insert('items', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateItem(int id, String title, String? descr, String? note, int isCompleted, String? imagePath) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descr,
      'note': note,
      'isCompleted': isCompleted,
      'imagePath': imagePath,
    };

    final result = await db.update('items', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }
}