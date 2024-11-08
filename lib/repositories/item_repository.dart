import 'package:sqflite/sqflite.dart';

import '../db/database_helper.dart';

class ItemRepository {
  final DatabaseHelper _dbHelper;

  ItemRepository(this._dbHelper);

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await _dbHelper.database;
    return await db.query('items');
  }

  Future<void> addItem(Map<String, dynamic> item) async {
    final db = await _dbHelper.database;
    await db.insert('items', item);
  }

  Future<void> deleteItem(int id) async {
    final db = await _dbHelper.database;
    await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
}
