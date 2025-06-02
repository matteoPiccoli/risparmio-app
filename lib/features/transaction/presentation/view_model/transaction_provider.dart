import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/transaction_repository.dart';
import './transaction_notifier.dart';
import './transaction_state.dart';

/// Provides an instance of the [TransactionRepository].
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository();
});

/// Provides the state and notifier for transaction-related logic.
///
/// Use this in the UI with:
/// - `ref.watch(transactionNotifierProvider)` to listen to state
/// - `ref.read(transactionNotifierProvider.notifier)` to call actions
final transactionNotifierProvider =
    StateNotifierProvider<TransactionNotifier, TransactionState>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return TransactionNotifier(repository);
});
