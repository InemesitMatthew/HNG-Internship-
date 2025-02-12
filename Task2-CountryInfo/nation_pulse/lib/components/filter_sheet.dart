import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override

  /// Builds the filter sheet widget.
  ///
  /// This widget displays a filter sheet for selecting continents and time zones.
  /// It uses a `Consumer` to access the `AppProvider`, which provides the list
  /// of available continents and time zones. The filter sheet includes `ExpansionTile`
  /// widgets for continents and time zones, each containing a list of `CheckboxListTile`
  /// widgets. Users can select or deselect items to filter by. The sheet also includes
  /// a "Reset" button to clear all selections and a "Show results" button to close the
  /// sheet and apply the selected filters.

  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter by',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: const Text('Continent'),
                        children: provider.continents
                            .map(
                              (continent) => CheckboxListTile(
                                title: Text(continent),
                                value: provider.filter.selectedContinents
                                    .contains(continent),
                                onChanged: (_) =>
                                    provider.toggleContinent(continent),
                              ),
                            )
                            .toList(),
                      ),
                      ExpansionTile(
                        title: const Text('Time Zone'),
                        children: provider.timeZones
                            .map(
                              (timeZone) => CheckboxListTile(
                                title: Text(timeZone),
                                value: provider.filter.selectedTimeZones
                                    .contains(timeZone),
                                onChanged: (_) =>
                                    provider.toggleTimeZone(timeZone),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: provider.resetFilters,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Show results',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
