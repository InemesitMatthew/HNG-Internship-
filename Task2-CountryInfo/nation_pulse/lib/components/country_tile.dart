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
      leading: Image.network(
        country.flagUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.flag_rounded);
        },
      ),
      title: Text(country.name),
    );
  }
}
