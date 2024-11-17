import 'package:flutter/material.dart';
import '../models/countrymodel.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(country.flag, width: 50, fit: BoxFit.cover),
        title: Text(country.name),
        subtitle: Text(country.region),
        onTap: () {
          Navigator.of(context).pushNamed('/details', arguments: country);
        },
      ),
    );
  }
}
