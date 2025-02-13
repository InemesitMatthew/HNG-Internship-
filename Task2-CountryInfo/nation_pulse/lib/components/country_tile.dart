import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Country country;

  const CountryTile({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override

  /// Builds a list tile for a country, with a flag image on the left, the
  /// country name as the title, and the capital as the subtitle.
  ///
  /// The tile is tappable and calls the `onTap` callback when tapped. The
  /// flag image is a 40x40 rounded rectangle with a circular border radius
  /// of 10. If the image fails to load, a flag icon is displayed instead.
  ///
  /// The capital text is displayed in the color scheme's tertiary color.
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
