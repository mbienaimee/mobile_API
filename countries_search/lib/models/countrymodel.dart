class Country {
  final String name;
  final String region;
  final String? subregion;
  final String? capital;
  final int population;
  final String flagUrl;
  final List<String> languages;
  final List<String> currencies;

  Country({
    required this.name,
    required this.region,
    this.subregion,
    this.capital,
    required this.population,
    required this.flagUrl,
    required this.languages,
    required this.currencies,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'Unknown',
      region: json['region'] ?? 'Unknown',
      subregion: json['subregion'],
      capital: (json['capital'] != null && (json['capital'] as List).isNotEmpty)
          ? json['capital'][0]
          : null,
      population: json['population'] ?? 0,
      flagUrl: json['flags']['png'] ?? '',
      languages: (json['languages'] != null)
          ? (json['languages'] as Map<String, dynamic>).values.toList().cast<String>()
          : [],
      currencies: (json['currencies'] != null)
          ? (json['currencies'] as Map<String, dynamic>)
              .entries
              .map((entry) => '${entry.value['name']} (${entry.value['symbol'] ?? ''})')
              .toList()
          : [],
    );
  }
}