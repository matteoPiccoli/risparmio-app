import 'package:uuid/uuid.dart';
import 'package:risparmio/features/transaction/data/models/transaction.dart';

/// Represents a category to be assigned to a [Transaction]
/// 
/// Each category has an id, name and [TransactionType]. All the categories are for now hard-coded
/// in the default_categories.dart file
class Category {
  /// Unique identifier for this category
  final String id;

  /// Name of the category (e.g., "Food", "Utilities", "Salary")
  final String name;

  /// Type of transactions this category belongs to: income or expense
  final TransactionType type;

  const Category({
    required this.id,
    required this.name,
    required this.type
  });

  /// Creates a new category with a unique ID.
  ///
  /// Use this factory when you want to create a new category without
  /// manually specifying the `id`. This is the main way to construct a category.
  factory Category.create({
    required String name,
    required TransactionType type
  }) {
    return Category._internal(
      id: _uuid.v4(),
      name: name,
      type: type
    );
  }

  /// Internal constructor that takes a specific ID (used by the factory).
  const Category._internal({
    required this.id,
    required this.name,
    required this.type
  });

  /// Converts a Category to a Map (for DB insertion)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type.name, // Store as string ("income"/"expense")
    };
  }

  /// Converts a DB row to a Category (for DB retrieval)
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      type: TransactionType.values.firstWhere((e) => e.name == map['type']),
    );
  }
}

// Internal UUID generator for category IDs.
final _uuid = Uuid();
