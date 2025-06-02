import 'package:risparmio/features/transaction/data/dao/transaction_dao.dart';
import '../models/transaction.dart';

/// Repository that acts as an abstraction layer between the data source (DAO)
/// and the business logic (view models or use cases).
///
/// This layer allows you to decouple the underlying database implementation
/// from the rest of your application. It can also be extended to support
/// remote APIs or caching in the future.
class TransactionRepository {
  final TransactionDao _dao = TransactionDao();

  /// Retrieves all transactions stored in the database.
  ///
  /// Returns a list of [Transaction] objects.
  Future<List<Transaction>> getAllTransactions() {
    return _dao.getAllTransactions();
  }

  /// Adds a new transaction to the database.
  ///
  /// [transaction] is the [Transaction] object to be inserted.
  Future<void> addTransaction(Transaction transaction) {
    return _dao.insertTransaction(transaction);
  }

  /// Deletes a transaction from the database by its [id].
  ///
  /// [id] is the unique identifier of the transaction to delete.
  Future<void> deleteTransaction(String id) {
    return _dao.deleteTransaction(id);
  }

  /// Updates an existing transaction in the database.
  ///
  /// [transaction] is the updated [Transaction] object.
  Future<void> updateTransaction(Transaction transaction) {
    return _dao.updateTransaction(transaction);
  }
}
