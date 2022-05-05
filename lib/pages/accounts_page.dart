import 'package:flutter/material.dart';
import 'package:nexxera_account_app/data/account_model.dart';
import 'package:nexxera_account_app/data/repository.dart';
import 'package:nexxera_account_app/routes.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accounts = Repository.getAccounts();
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Contas'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => const [
                PopupMenuItem(
                  child: Text('Nova conta'),
                  value: Routes.createAccount,
                ),
                PopupMenuItem(
                  child: Text('Nova transação'),
                  value: Routes.createTransaction,
                ),
              ],
              onSelected: (String? routeName) {
                Navigator.pushNamed(context, routeName!);
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: accounts.length,
          itemBuilder: ((context, index) =>
              _buildListItem(context, accounts[index])),
        ));
  }

  Widget _buildListItem(BuildContext context, AccountModel account) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(2.0),
        child: ListTile(
          title: Text(account.holderName),
          subtitle: Text('Conta: ${account.number}'),
          trailing: IconButton(
            icon: const Icon(Icons.list_alt_rounded),
            onPressed: () {
              Navigator.pushNamed(context, Routes.extract);
            },
          ),
        ),
      ),
    );
  }
}
