import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
/// Builds a widget tree that contains a search bar for searching countries.
///
/// This widget uses a `TextField` with a search icon and a hint text 'Search Countries...'.
/// It is wrapped in a `Consumer` to access the `AppProvider` for managing the search query.
///
/// The `InputDecoration` is used to style the `TextField` with a border and hint style
/// that adapts to the current theme. When the text in the `TextField` changes, it updates
/// the search query in the `AppProvider`.
///
/// Returns a `Widget` that represents the search bar.

  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return TextField(
          decoration: InputDecoration(
            hintText: 'Search Countries...',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            prefixIcon: const Icon(Icons.search_rounded),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          onChanged: (value) => provider.setSearchQuery(value),
        );
      },
    );
  }
}
