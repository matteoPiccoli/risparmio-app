import 'package:risparmio/features/category/data/models/category.dart';
import 'package:risparmio/features/transaction/data/models/transaction.dart';

/// List of default categories. Now are hard-coded, but in the future will be editable from the user.

final defaultCategories = <Category>[
  Category.create(
    name: 'Family',
    type: TransactionType.expense,
  ),
  Category.create(
    name: 'Food',
    type: TransactionType.expense,
  ),
  Category.create(
    name: "Free Time",
    type: TransactionType.expense
  ),
  Category.create(
    name: 'Health',
    type: TransactionType.expense,
  ),
  Category.create(
    name: 'House',
    type: TransactionType.expense,
  ),
  Category.create(
    name: 'Investing',
    type: TransactionType.saving,
  ),
  Category.create(
    name: 'Salary',
    type: TransactionType.income,
  ),
  Category.create(
    name: 'Sports',
    type: TransactionType.expense,
  ),
  Category.create(
    name: 'Subscriptions',
    type: TransactionType.expense,
  ),
  Category.create(
    name: 'Transport',
    type: TransactionType.expense,
  )
];
