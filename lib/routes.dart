import 'package:flutter/material.dart';
import 'package:nexxera_account_app/pages/accounts_page.dart';
import 'package:nexxera_account_app/pages/create_account_page.dart';
import 'package:nexxera_account_app/pages/create_transaction_page.dart';
import 'package:nexxera_account_app/pages/extract_page.dart';

class Routes {
  static const accounts = 'accounts-listing';
  static const createAccount = 'accounts-create';
  static const extract = 'extract';
  static const createTransaction = 'transaction-create';

  static Map<String, WidgetBuilder> get routes => {
        accounts: (_) => const AccountsPage(),
        createAccount: (_) => const CreateAccountPage(),
        extract: (_) => const ExtractPage(),
        createTransaction: (_) => const CreateTransactionPage(),
      };
}
