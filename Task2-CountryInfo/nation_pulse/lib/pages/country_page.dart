import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../components/theme_toggle.dart';
import '../models/country.dart';

class CountryPage extends StatelessWidget {
  final Country country;

  const CountryPage({
    super.key,
    required this.country,
  });

  /// Formats a given population number by inserting commas as thousands separators.
  ///
  /// Takes an integer [population] and returns a string representation with
  /// commas inserted at every thousand. The formatting follows the 'en_US' locale
  /// pattern. For example, an input of 1000000 will return "1,000,000".
  ///
  /// - Parameters:
  ///   - population: An integer representing the population count to be formatted.
  ///
  /// - Returns: A string with the population number formatted with commas.

  String formatPopulation(int population) {
    final NumberFormat formatter = NumberFormat('#,##0', 'en_US');
    String formatted = formatter.format(population);
    return formatted.replaceAll(',', ',').replaceAllMapped(
        RegExp(r'\.(\d{3})$'), (match) => ',${match.group(1)}');
  }

  @override

  /// Builds the country page widget tree.
  ///
  /// The page consists of a [Scaffold] with an [AppBar] and a [SingleChildScrollView]
  /// body. The app bar has a title displaying the country name and an action with a
  /// [ThemeToggle]. The body contains a [Column] with the country flag image, name,
  /// capital, population, continent, and country code. The flag image is displayed
  /// in a larger size and centered. The rest of the information is displayed in a
  /// column with a [SizedBox] of height 10 between each item. The text is styled with
  /// the Roboto font, size 20, and the color of the inverse primary color.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name,
          style: GoogleFonts.handjet(
            fontSize: 25,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: const [
          ThemeToggle(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the flag image in a larger size.
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  country.flagUrl,
                  height: 200,
                  width: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.flag_rounded,
                      size: 200,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Display the country's name and capital.
            Text(
              'Capital: ${country.capital}',
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 10),

            // Display the country's population.
            Text(
              'Population: ${formatPopulation(country.population)}',
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 10),

            // Display the Continent.
            Text(
              'Continent: ${country.continent}',
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 10),

            // Display the Country Code.
            Text(
              'Country Code: ${country.countryCode}',
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
