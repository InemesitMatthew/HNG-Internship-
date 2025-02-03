import 'package:flutter/material.dart';
import '../utils/encryption.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controllers for the text fields.
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  // Variables to hold the result of the encryption/decryption.
  String _result = '';

  /// Calls the encrypt function and updates the UI.
  void _handleEncrypt() {
    // check if key is not empty.
    if (_keyController.text.isEmpty) {
      _showSnackBar('Please enter a key.');
      return;
    }
    setState(() {
      _result = encrypt(_inputController.text, _keyController.text);
    });
  }

  /// Calls the decrypt function and updates the UI.
  void _handleDecrypt() {
    // check if key is not empty.
    if (_keyController.text.isEmpty) {
      _showSnackBar('Please enter a key.');
      return;
    }
    setState(() {
      _result = decrypt(_inputController.text, _keyController.text);
    });
  }

  /// Displays a SnackBar with the given message.
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xorify'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Input textfield (for plaintext or ciper text).
              TextField(
                controller: _inputController,
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
              const SizedBox(height: 15),

              // Key textfield.
              TextField(
                controller: _keyController,
                decoration: const InputDecoration(
                  labelText: 'Enter key',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),
              // Buttons for encrypt and decrypt actions.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _handleEncrypt,
                    child: const Text('Encrypt'),
                  ),
                  ElevatedButton(
                    onPressed: _handleDecrypt,
                    child: const Text('Decrypt'),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Display the result of the encryption/decryption.
              Text(
                "Result:",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _result,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
