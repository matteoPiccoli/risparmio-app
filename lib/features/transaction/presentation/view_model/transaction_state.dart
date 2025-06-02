import '../../data/models/transaction.dart';

/// Represents the state of transactions in the app.
///
/// This includes:
/// - The list of current transactions
/// - Whether data is currently being loaded
/// - An optional error message
class TransactionState {
  final List<Transaction> transactions;
  final bool isLoading;
  final String? error;

  TransactionState({
    required this.transactions,
    this.isLoading = false,
    this.error,
  });

  /// Creates a copy of this state with updated values.
  TransactionState copyWith({
    List<Transaction>? transactions,
    bool? isLoading,
    String? error,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
