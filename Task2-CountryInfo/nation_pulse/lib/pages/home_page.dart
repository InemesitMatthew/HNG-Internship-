import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import '../components/country_tile.dart';
import '../components/filter_button.dart';
import '../components/language_button.dart';
import '../components/search_bar.dart';
import '../components/theme_toggle.dart';
import '../models/country.dart';
import '../services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nation Pulse',
          style: GoogleFonts.dmSerifText(
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
            padding: EdgeInsets.all(10.0),
            child: MySearchBar(),
          ),
          // Row for Language and Filter Buttons
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Reusable Language Button
                LanguageButton(),
                // Reusable Filter Button
                FilterButton(),
              ],
            ),
          ),
          // FutureBuilder to fetch and display the list of countries grouped alphabetically.
          Expanded(
            child: FutureBuilder<List<Country>>(
              future: ApiService.fetchCountries(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No countries found.'));
                } else {
                  final countries = snapshot.data!;
                  return GroupedListView<Country, String>(
                    elements: countries,
                    // Group countries by the first letter of the country's name.
                    groupBy: (country) =>
                        country.name.substring(0, 1).toUpperCase(),
                    groupSeparatorBuilder: (String groupByValue) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        groupByValue,
                        style: GoogleFonts.dmSerifText(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    itemBuilder: (context, country) =>
                        CountryTile(country: country),
                    order: GroupedListOrder.ASC,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
