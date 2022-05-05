import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nexxera_account_app/data/extract_model.dart';
import 'package:nexxera_account_app/data/repository.dart';
import 'package:nexxera_account_app/data/transaction_model.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final extract = Repository.getExtract();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
        actions: [
          IconButton(
            onPressed: () {
              _openFilterDialog(context);
            },
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: extract.transactions.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildBalanceHeader(extract);
          }

          return _buildTransactionItem(extract.transactions[index - 1]);
        },
      ),
    );
  }

  Widget _buildBalanceHeader(ExtractModel extract) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Saldo:',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              Expanded(
                child: Text('Início: R\$ ${extract.balanceStartPeriod}'),
              ),
              Expanded(
                child: Text('Final: R\$ ${extract.balanceEndPeriod}'),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }

  Widget _buildTransactionItem(TransactionModel transaction) {
    Color iconColor;
    IconData icon;

    switch (transaction.operation) {
      case TransactionOperation.debit:
        iconColor = Colors.red;
        icon = Icons.remove;
        break;
      case TransactionOperation.credit:
        iconColor = Colors.green;
        icon = Icons.add;
        break;
    }

    return ListTile(
      title: Text('R\$ ${transaction.value}'),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(transaction.description),
          Text(transaction.dateFormatted),
        ],
      ),
      leading: Icon(icon, color: iconColor),
    );
  }

  void _openFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const FilterForm(),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Aplicar'),
          )
        ],
      ),
    );
  }
}

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key}) : super(key: key);

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  String operation = 'credit';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildOperationRadioButtons(),
          _buildPeriodInputs(),
        ],
      ),
    );
  }

  Widget _buildOperationRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Operação:'),
        Row(children: [
          Radio(
            value: 'credit',
            groupValue: operation,
            onChanged: (String? value) {
              setState(() {
                operation = value!;
              });
            },
          ),
          const Text('Crédito')
        ]),
        Row(children: [
          Radio(
            value: 'debit',
            groupValue: operation,
            onChanged: (String? value) {
              setState(() {
                operation = value!;
              });
            },
          ),
          const Text('Débito'),
        ])
      ],
    );
  }

  Widget _buildPeriodInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Período:'),
        const SizedBox(height: 10.0),
        TextFormField(
          inputFormatters: [
            MaskTextInputFormatter(mask: '##/##/####'),
          ],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text('Início'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          inputFormatters: [
            MaskTextInputFormatter(mask: '##/##/####'),
          ],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text('Final'),
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
