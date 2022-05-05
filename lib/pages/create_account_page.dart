import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova conta'),
      ),
      body: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Nome titular:'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Número:'),
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
    );
  }
}
