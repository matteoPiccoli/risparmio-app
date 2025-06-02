import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/transaction_provider.dart';
import '../widgets/add_transaction_dialog.dart';
import '../../../category/data/models/default_categories.dart';

class TransactionListScreen extends ConsumerWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionNotifierProvider).transactions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: transactions.isEmpty
          ? const Center(child: Text('No transactions yet'))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final txn = transactions[index];
                return ListTile(
                  title: Text(txn.description),
                  subtitle: Text(txn.date.toLocal().toString()),
                  trailing: Text('${txn.amount.toStringAsFixed(2)} €'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTransactionDialog(
            categories: defaultCategories,
            onSubmit: (transaction) {
              ref.read(transactionNotifierProvider.notifier).addTransaction(transaction);
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
