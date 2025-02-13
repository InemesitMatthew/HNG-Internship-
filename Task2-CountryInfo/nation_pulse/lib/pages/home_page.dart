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

  /// Builds the main UI for the HomePage.
  ///
  /// The widget tree consists of a [Scaffold] with an [AppBar] and a [Column]
  /// as its body. The [AppBar] contains the title 'Nation Pulse' and a theme
  /// toggle button. The body includes a [MySearchBar], a row with [LanguageButton]
  /// and [FilterButton], and a [Consumer] that listens to [AppProvider].
  ///
  /// The [Consumer] manages the state of the country list, displaying a
  /// [CircularProgressIndicator] while loading, an error message and retry button
  /// on failure, and a message if no countries are found. If countries are
  /// available, they are displayed using a [GroupedListView], grouped by the
  /// first letter of the country name. Tapping a country tile navigates to the
  /// country's page.

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Title with red dot at the bottom left
        title: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Text(
              'Nation Pulse',
              style: GoogleFonts.lobster(
                fontSize: 30,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            // Red dot positioned at the bottom left of the title
            Positioned(
              bottom: 0,
              left: 80, // Adjust this value to position the dot correctly
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.red, // Change this to your desired color
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
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
                    itemBuilder: (context, country) => CountryTile(
                      country: country,
                      // Navigate to the country page when the tile is tapped.
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/country_page',
                          arguments:
                              country, // where country is a Country instance.
                        );
                      },
                    ),
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
