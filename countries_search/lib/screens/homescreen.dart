import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/countriesprovider.dart';
import '../widgets/countrycard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries Explorer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.of(context).pushNamed('/search'),
          ),
        ],
      ),
      body: Consumer<CountriesProvider>(
        builder: (ctx, countriesProvider, _) {
          return FutureBuilder(
            future: countriesProvider.fetchCountries(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('An error occurred: ${snapshot.error}'),
                );
              } else if (countriesProvider.countries.isEmpty) {
                return const Center(child: Text('No countries found.'));
              }

              return ListView.builder(
                itemCount: countriesProvider.countries.length,
                itemBuilder: (ctx, i) {
                  return CountryCard(country: countriesProvider.countries[i]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
