import 'package:flutter/material.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova transação'),
      ),
      body: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Conta'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15.0),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  child: Text('Crédito'),
                  value: 'credit',
                ),
                DropdownMenuItem(
                  child: Text('Débito'),
                  value: 'debit',
                ),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                label: Text('Operação'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Valor'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Descrição'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
