import 'package:nexxera_account_app/data/transaction_model.dart';

class ExtractModel {
  double balanceStartPeriod;
  double balanceEndPeriod;
  List<TransactionModel> transactions;

  ExtractModel({
    required this.balanceStartPeriod,
    required this.balanceEndPeriod,
    required this.transactions,
  });
}
