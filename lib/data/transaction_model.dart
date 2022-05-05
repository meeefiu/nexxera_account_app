enum TransactionOperation { debit, credit }

class TransactionModel {
  double value;
  DateTime createdAt;
  String description;
  TransactionOperation operation;

  TransactionModel({
    required this.value,
    required this.createdAt,
    required this.description,
    required this.operation,
  });

  String get dateFormatted {
    final date = createdAt.toIso8601String().split('T').first;

    return date.split('-').reversed.join('/');
  }
}
