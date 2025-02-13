import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        note TEXT,
        isCompleted INTEGER
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbitems.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  static Future<int> createItem(String title, String? description, String? note) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': description, 'note': note, 'isCompleted': 0};
    final id = await db.insert('items', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String title, String? description, String? note, int isCompleted) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'note': note,
      'isCompleted': isCompleted,
    };

    final result = await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete an item by id
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}