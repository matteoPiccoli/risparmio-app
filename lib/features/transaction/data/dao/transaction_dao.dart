import 'package:sqflite/sqflite.dart';
import 'package:risparmio/core/db/database_helper.dart';
import 'package:risparmio/features/transaction/data/models/transaction.dart' as txn;

/// Data Access Object (DAO) for managing transactions in the local database.
/// 
/// Provides methods to insert, retrieve, update, and delete financial transactions.
class TransactionDao {
  final dbHelper = DatabaseHelper();

  /// Inserts a new transaction into the database.
  /// 
  /// If a transaction with the same ID already exists, it will be replaced.
  /// 
  /// Returns the row ID of the inserted transaction.
  Future<int> insertTransaction(txn.Transaction transaction) async {
    final db = await dbHelper.database;

    return await db.insert(
      'transactions',
      transaction.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves all transactions from the database.
  /// 
  /// Returns a list of [Transaction] objects.
  Future<List<txn.Transaction>> getAllTransactions() async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query('transactions');

    return maps
        .map((map) => txn.Transaction.fromMap(map))
        .toList();
  }

  /// Retrieves transactions filtered by type (e.g., income or expense).
  /// 
  /// [type] is the type of transaction to filter by.
  /// 
  /// Returns a list of [Transaction] objects matching the given type.
  Future<List<txn.Transaction>> getTransactionsByType(txn.TransactionType type) async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'transactions',
      where: 'type = ?',
      whereArgs: [type.index], // enums are stored as integers
    );

    return maps.map((map) => txn.Transaction.fromMap(map)).toList();
  }

  /// Deletes a transaction by its [id].
  /// 
  /// Returns the number of rows affected (should be 1 if successful).
  Future<int> deleteTransaction(String id) async {
    final db = await dbHelper.database;

    return await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Updates an existing transaction.
  /// 
  /// The transaction is matched by its [id].
  /// 
  /// Returns the number of rows affected.
  Future<int> updateTransaction(txn.Transaction transaction) async {
    final db = await dbHelper.database;

    return await db.update(
      'transactions',
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }
}
