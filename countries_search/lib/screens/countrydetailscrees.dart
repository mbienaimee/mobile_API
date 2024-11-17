import 'package:flutter/material.dart';
import '../models/countrymodel.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context)!.settings.arguments as Country;

    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(country.flag, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text('Region: ${country.region}', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text('Population: ${country.population}', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
