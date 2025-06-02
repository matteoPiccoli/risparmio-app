import 'package:sqflite/sqflite.dart';
import 'package:risparmio/features/transaction/data/models/transaction.dart';
import 'package:risparmio/features/category/data/models/category.dart';
import 'package:risparmio/core/db/database_helper.dart';

/// Data Access Object (DAO) for managing categories in the local database.
/// 
/// Provides methods to insert, retrieve, update, and delete transaction categories.
class CategoryDao {
  final dbHelper = DatabaseHelper();

  /// Inserts a new category into the database.
  /// 
  /// If a category with the same ID already exists, it will be replaced.
  /// 
  /// Returns the row ID of the inserted category.
  Future<void> insertCategory(Category category) async {
    final db = await dbHelper.database;
    await db.insert(
      'categories',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves all categorties from the database.
  /// 
  /// Returns a list of [Category] objects.
  Future<List<Category>> getAllCategories() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');

    return maps.map((map) => Category.fromMap(map)).toList();
  }

  /// Retrieves categories filtered by type (e.g., income or expense).
  /// 
  /// [type] is the type of transaction to filter by.
  /// 
  /// Returns a list of [Category] objects matching the given type.
  Future<List<Category>> getCategoriesByType(TransactionType type) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'categories',
      where: 'type = ?',
      whereArgs: [type.name],
    );
    return maps.map((map) => Category.fromMap(map)).toList();
  }

  /// Deletes a category by its [id].
  /// 
  /// Returns the number of rows affected (should be 1 if successful).
  Future<void> deleteCategory(String id) async {
    final db = await dbHelper.database;
    await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Updates an existing category.
  /// 
  /// The category is matched by its [id].
  /// 
  /// Returns the number of rows affected.
  Future<void> updateCategory(Category category) async {
    final db = await dbHelper.database;
    await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }
}
