import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;

  const CountryTile({
    super.key,
    required this.country,
  });

  @override
  /// Builds a ListTile widget that displays a country's flag, name, and capital.
  ///
  /// The flag is displayed as an image with rounded corners. If the image fails
  /// to load, a default flag icon is shown. The country's name is displayed as
  /// the title, and its capital is shown as the subtitle with a color
  /// determined by the current theme's tertiary color.

  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          country.flagUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.flag_rounded);
          },
        ),
      ),
      title: Text(country.name),
      subtitle: Text(
        country.capital,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
