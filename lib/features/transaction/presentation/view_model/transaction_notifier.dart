import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/transaction.dart';
import '../../data/repositories/transaction_repository.dart';
import 'transaction_state.dart';

/// A [StateNotifier] that manages the state of transactions.
///
/// It interacts with the [TransactionRepository] to fetch, add, update,
/// and delete transactions from the database, and updates the UI state accordingly.
class TransactionNotifier extends StateNotifier<TransactionState> {
  final TransactionRepository _repository;

  /// Creates a [TransactionNotifier] with the given repository
  /// and loads initial transactions.
  TransactionNotifier(this._repository)
      : super(TransactionState(transactions: [])) {
    loadTransactions(); // Load initial data
  }

  /// Loads all transactions from the repository and updates the state.
  Future<void> loadTransactions() async {
    state = state.copyWith(isLoading: true);
    try {
      final transactions = await _repository.getAllTransactions();
      state = state.copyWith(transactions: transactions, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Adds a new transaction to the database and reloads the transaction list.
  Future<void> addTransaction(Transaction transaction) async {
    await _repository.addTransaction(transaction);
    await loadTransactions(); // Refresh the state
  }

  /// Deletes a transaction by ID and refreshes the state.
  Future<void> deleteTransaction(String id) async {
    await _repository.deleteTransaction(id);
    await loadTransactions();
  }

  /// Updates an existing transaction and reloads the data.
  Future<void> updateTransaction(Transaction transaction) async {
    await _repository.updateTransaction(transaction);
    await loadTransactions();
  }
}
