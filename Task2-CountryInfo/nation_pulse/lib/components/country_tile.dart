import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;

  const CountryTile({
    super.key,
    required this.country,
  });

  @override
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
