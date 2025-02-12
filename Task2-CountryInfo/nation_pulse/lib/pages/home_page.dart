import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import '../components/country_tile.dart';
import '../components/filter_button.dart';
import '../components/language_button.dart';
import '../components/search_bar.dart';
import '../components/theme_toggle.dart';
import '../providers/app_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override

  /// Builds the home page UI with a search bar, a row of buttons for language
  /// and filter, and a list of countries grouped alphabetically. The list is
  /// fetched from the API service and displayed in a FutureBuilder. If the
  /// list is empty, a message is displayed. If there is an error, an error
  /// message is displayed. The list is displayed in a GroupedListView with
  /// group separators and a bold, tertiary-colored font. Each country is
  /// displayed in a CountryTile widget.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nation Pulse',
          style: GoogleFonts.lobster(
            fontSize: 30,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: const [
          // Reusable theme toggle button.
          ThemeToggle(),
        ],
      ),
      body: Column(
        children: [
          // Search Bar Component
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: MySearchBar(),
          ),
          // Row for Language and Filter Buttons
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Reusable Language Button
                LanguageButton(),
                // Reusable Filter Button
                FilterButton(),
              ],
            ),
          ),

          // Consumer for Provider-based state management
          Expanded(
            child: Consumer<AppProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Display error message and retry button
                if (provider.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(provider.error!), // Display error message
                        ElevatedButton(
                          onPressed: provider.refreshData,
                          child: const Text('Retry'),
                        ), // Retry button
                      ],
                    ),
                  );
                }

                // Display message if no countries are found
                if (provider.filteredCountries.isEmpty) {
                  return const Center(
                    child: Text('No countries found.'),
                  );
                }

                // Display GroupedListView with group separators
                return RefreshIndicator(
                  onRefresh: provider.refreshData,
                  child: GroupedListView(
                    elements: provider.filteredCountries,
                    // Group countries by the first letter of the country's name.
                    groupBy: (country) =>
                        country.name.substring(0, 1).toUpperCase(),
                    groupSeparatorBuilder: (String groupByValue) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        groupByValue,
                        style: GoogleFonts.firaSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    itemBuilder: (context, country) =>
                        CountryTile(country: country),
                    order: GroupedListOrder.ASC,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
