import 'package:uuid/uuid.dart';

/// Represents a financial transaction, either an income or an expense.
///
/// Each transaction has an amount, description, date, category, and type.
/// The [TransactionType] indicates whether it's money in or out.
/// An auto-generated UUID is used to uniquely identify each transaction.
class Transaction {
  /// Unique ID for this transaction (auto-generated).
  final String id;

  /// Positive amount of money involved in the transaction.
  final double amount;

  /// Optional description of the transaction (e.g., "Lunch at McDonald's").
  final String description;

  /// Date and time the transaction occurred.
  final DateTime date;

  /// The ID of the category this transaction belongs to (e.g., "food", "salary").
  final String categoryId;

  /// Whether the transaction is an [TransactionType.income] or [TransactionType.expense].
  final TransactionType type;

  /// Creates a new transaction with a unique ID.
  ///
  /// Use this factory when you want to create a new transaction without
  /// manually specifying the `id`. This is the main way to construct a transaction.
  factory Transaction.create({
    required double amount,
    required String description,
    required DateTime date,
    required String categoryId,
    required TransactionType type,
  }) {
    return Transaction._internal(
      id: _uuid.v4(),
      amount: amount,
      description: description,
      date: date,
      categoryId: categoryId,
      type: type,
    );
  }

  /// Internal constructor that takes a specific ID (used by the factory).
  const Transaction._internal({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.type,
  });
}

/// Type of a financial transaction.
enum TransactionType {
  /// An income (e.g., salary, refund).
  income,

  /// An expense (e.g., groceries, bills).
  expense,
}

// Internal UUID generator for transaction IDs.
final _uuid = Uuid();
