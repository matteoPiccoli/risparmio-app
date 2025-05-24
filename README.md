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
│   ├── transaction/
│   │   ├── domain/             # Pure business logic (no imports from Flutter)
│   │   │   ├── entities/       # Core models: Transaction, Category
│   │   │   └── repositories/   # Abstract interfaces (e.g., TransactionRepository)
│   │   ├── data/               # DB layer (sqflite or drift)
│   │   │   ├── models/         # TransactionModel (for serialization)
│   │   │   ├── datasources/    # SQLite service, local data provider
│   │   │   └── repositories/   # Concrete repo implementing domain interface
│   │   └── presentation/       # UI + state management
│   │       ├── view/           # Screens (TransactionListScreen, AddTransactionScreen)
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
└── transaction/
    ├── domain/
    │   ├── entities/
    │   │   └── transaction.dart         # class Transaction { final double amount; ... }
    │   └── repositories/
    │       └── transaction_repository.dart  # abstract class TransactionRepository
    ├── data/
    │   ├── models/
    │   │   └── transaction_model.dart   # TransactionModel for SQLite (toMap/fromMap)
    │   ├── datasources/
    │   │   └── transaction_db.dart      # LocalDatabase (sqflite, drift, etc.)
    │   └── repositories/
    │       └── transaction_repository_impl.dart # Implements TransactionRepository
    └── presentation/
        ├── view/
        │   └── transaction_list_screen.dart
        ├── view_model/
        │   └── transaction_view_model.dart     # State logic (Notifier, ChangeNotifier)
        └── widgets/
            └── transaction_card.dart

test/
├── features/
│   ├── transaction/
│   │   ├── view_model/
│   │   ├── widgets/
│   │   └── integration/
├── core/
├── data/
└── utils/
