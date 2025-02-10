import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.filter_list_rounded),
      label: const Text('Filter'),
      onPressed: () {
        // Future implementation: Show filter options dropdown.
      },
    );
  }
}