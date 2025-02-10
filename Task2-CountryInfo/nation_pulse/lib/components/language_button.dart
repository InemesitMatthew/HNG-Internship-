import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.language),
      label: const Text('Language'),
      onPressed: () {
        // Future implementation: Show language selection dropdown.
      },
    );
  }
}