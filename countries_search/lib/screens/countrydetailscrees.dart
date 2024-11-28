import 'package:flutter/material.dart';
import '../models/countrymodel.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(country.name),
              background: Hero(
                tag: country.name,
                child: Image.network(
                  country.flagUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildInfoCard(
                  'Region',
                  '${country.region}${country.subregion != null ? ' - ${country.subregion}' : ''}',
                  Icons.public,
                ),
                _buildInfoCard(
                  'Population',
                  country.population.toString(),
                  Icons.people,
                ),
                if (country.capital != null)
                  _buildInfoCard(
                    'Capital',
                    country.capital!,
                    Icons.location_city,
                  ),
                if (country.languages.isNotEmpty)
                  _buildInfoCard(
                    'Languages',
                    country.languages.join(', '),
                    Icons.language,
                  ),
                if (country.currencies.isNotEmpty)
                  _buildInfoCard(
                    'Currencies',
                    country.currencies.join(', '),
                    Icons.attach_money,
                  ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
