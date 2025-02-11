import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: Icon(
        Icons.language_rounded,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      label: Text(
        // it is not supposed to be fixed as 'language'
        // its supposed to change depending on the selected language
        // E.g if its in eng it should show EN and if its in french it should show FR
        'EN',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      onPressed: () {
        // Future implementation: Show language selection dropdown.
      },
    );
  }
}
