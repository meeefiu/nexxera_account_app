import 'package:nexxera_account_app/data/account_model.dart';
import 'package:nexxera_account_app/data/extract_model.dart';
import 'package:nexxera_account_app/data/transaction_model.dart';

class Repository {
  static List<AccountModel> getAccounts() {
    return [
      AccountModel(number: '12345', balance: 100.0, holderName: 'Ana'),
      AccountModel(number: '23234', balance: 1050.0, holderName: 'Marcos'),
      AccountModel(number: '456456', balance: 90.0, holderName: 'José'),
      AccountModel(number: '678678', balance: 450.0, holderName: 'Maria'),
      AccountModel(number: '123123', balance: 678.0, holderName: 'Bruno'),
      AccountModel(number: '234567', balance: 1678.0, holderName: 'Paulo'),
    ];
  }

  static ExtractModel getExtract() {
    final transactions = <TransactionModel>[
      TransactionModel(
          value: 600.0,
          createdAt: DateTime(2022, 01, 01),
          description: 'Credito 1',
          operation: TransactionOperation.credit),
      TransactionModel(
          value: 300.0,
          createdAt: DateTime(2022, 01, 01),
          description: 'Credito 2',
          operation: TransactionOperation.credit),
      TransactionModel(
          value: 200.0,
          createdAt: DateTime(2022, 01, 04),
          description: 'Débito 1',
          operation: TransactionOperation.debit),
      TransactionModel(
          value: 1000.0,
          createdAt: DateTime(2022, 01, 07),
          description: 'Pagamento 3',
          operation: TransactionOperation.credit),
      TransactionModel(
          value: 200.0,
          createdAt: DateTime(2022, 01, 10),
          description: 'Débito 2',
          operation: TransactionOperation.debit),
    ];
    return ExtractModel(
      balanceStartPeriod: 100.0,
      balanceEndPeriod: 1500.0,
      transactions: transactions,
    );
  }
}
