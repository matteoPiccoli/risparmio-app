/// A financial transaction: either an expense or an income.
/// 
/// Each transaction is linked to a category and has a type
/// (`TransactionType.income` or `TransactionType.expense`).

enum TransactionType {
  income,
  expense,
}

class Transaction {
  /// Unique ID for the transaction
  final String id;

  /// Positive amount of money for the transaction
  final double amount;

  /// Optional description (e.g., "Lunch at McDonald's")
  final String description;

  /// Date and time of the transaction
  final DateTime date;

  /// ID of the category this transaction belongs to
  final String categoryId;

  /// Indicates if the transaction is an income or an expense
  final TransactionType type;

  Transaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.type,
  });

  Transaction copyWith({
    String? id,
    double? amount,
    String? description,
    DateTime? date,
    String? categoryId,
    TransactionType? type,
  }) {
    return Transaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      type: type ?? this.type,
    );
  }
}
