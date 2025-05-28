import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

/// A singleton class responsible for managing the SQLite database.
/// 
/// This class initializes the database, creates tables, and provides a
/// reusable database instance across the application.
class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  /// Factory constructor that returns the singleton instance
  factory DatabaseHelper() => _instance;

  static Database? _database;

  /// Private constructor for singleton pattern
  DatabaseHelper._internal();

  /// Returns the singleton database instance, initializing it if necessary
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the SQLite database by creating/opening it
  Future<Database> _initDatabase() async {
    // Get the device-specific path to store the database
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'finance_tracker.db');

    // Open or create the database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Creates the necessary tables when the database is first created
  Future<void> _onCreate(Database db, int version) async {
    // Enable foreign key constraints
    await db.execute('PRAGMA foreign_keys = ON');

    // Create the categories table
    await db.execute('''
      CREATE TABLE categories (
        id TEXT PRIMARY KEY,           -- Unique ID for the category
        name TEXT NOT NULL,            -- Category name (e.g., Food, Salary)
        type TEXT NOT NULL             -- 'income', 'expense' or 'saving'
      )
    ''');

    // Create the transactions table
    await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY,           -- Unique ID for the transaction
        amount REAL NOT NULL,          -- Amount of money
        description TEXT,              -- Optional description
        date TEXT NOT NULL,            -- ISO 8601 formatted date
        category_id TEXT NOT NULL,     -- Foreign key to categories
        type TEXT NOT NULL,            -- 'income', 'expense' or 'saving' 
        FOREIGN KEY (category_id) REFERENCES categories(id)
      )
    ''');
  }
}
