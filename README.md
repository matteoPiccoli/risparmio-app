# risparmio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



lib/
├── main.dart                   # Entry point
├── app/                        # App-wide config (themes, routes, etc.)
│   ├── app.dart                # MaterialApp, routing
│   └── themes/                 # ThemeData for light/dark modes
├── core/                       # Global utilities and shared resources
│   ├── constants/              # App-wide constants, enums, colors
│   ├── utils/                  # Formatters, extensions, helpers
│   └── widgets/                # Reusable UI components (buttons, cards)
├── features/                   # Modular feature-based structure
│   ├── expense/
│   │   ├── domain/             # Pure business logic (no imports from Flutter)
│   │   │   ├── entities/       # Core models: Expense, Category
│   │   │   └── repositories/   # Abstract interfaces (e.g., ExpenseRepository)
│   │   ├── data/               # DB layer (sqflite or drift)
│   │   │   ├── models/         # ExpenseModel (for serialization)
│   │   │   ├── datasources/    # SQLite service, local data provider
│   │   │   └── repositories/   # Concrete repo implementing domain interface
│   │   └── presentation/       # UI + state management
│   │       ├── view/           # Screens (ExpenseListScreen, AddExpenseScreen)
│   │       ├── view_model/     # State management (e.g., Riverpod, Provider)
│   │       └── widgets/        # Feature-specific widgets
│   ├── reports/
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   └── settings/
│       └── presentation/       # Usually just UI, like theme toggle
├── l10n/                       # Localization (optional)


features/
└── expense/
    ├── domain/
    │   ├── entities/
    │   │   └── expense.dart         # class Expense { final double amount; ... }
    │   └── repositories/
    │       └── expense_repository.dart  # abstract class ExpenseRepository
    ├── data/
    │   ├── models/
    │   │   └── expense_model.dart   # ExpenseModel for SQLite (toMap/fromMap)
    │   ├── datasources/
    │   │   └── expense_db.dart      # LocalDatabase (sqflite, drift, etc.)
    │   └── repositories/
    │       └── expense_repository_impl.dart # Implements ExpenseRepository
    └── presentation/
        ├── view/
        │   └── expense_list_screen.dart
        ├── view_model/
        │   └── expense_view_model.dart     # State logic (Notifier, ChangeNotifier)
        └── widgets/
            └── expense_card.dart

test/
├── features/
│   ├── expense/
│   │   ├── view_model/
│   │   ├── widgets/
│   │   └── integration/
├── core/
├── data/
└── utils/
