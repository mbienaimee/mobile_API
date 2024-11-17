import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/countriesprovider.dart';
import '../widgets/countrycard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final countriesProvider = Provider.of<CountriesProvider>(context);
    final filteredCountries = countriesProvider.countries.where((country) {
      return country.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Countries'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by country name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredCountries.isEmpty
                ? const Center(
                    child: Text('No countries found. Try another search!'),
                  )
                : ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (ctx, i) {
                      return CountryCard(country: filteredCountries[i]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
