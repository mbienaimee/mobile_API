import 'package:flutter/material.dart';
import '../models/countrymodel.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(country.flagUrl),
            const SizedBox(height: 16),
            Text('Region: ${country.region}', style: const TextStyle(fontSize: 16)),
            Text('Population: ${country.population}', style: const TextStyle(fontSize: 16)),
            if (country.capital != null)
              Text('Capital: ${country.capital}', style: const TextStyle(fontSize: 16)),
            if (country.languages.isNotEmpty)
              Text('Languages: ${country.languages.join(", ")}', style: const TextStyle(fontSize: 16)),
            if (country.currencies.isNotEmpty)
              Text('Currencies: ${country.currencies.join(", ")}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}