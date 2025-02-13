class Country {
  final String name;
  final String capital;
  final String flagUrl;
  final int population;
  final String continent;
  final String countryCode;

  Country({
    required this.name,
    required this.capital,
    required this.flagUrl,
    required this.population,
    required this.continent,
    required this.countryCode,
  });

  // Factory method to create a new Country instance from a JSON object.
  factory Country.fromJson(Map<String, dynamic> json) {
    // Get capital (if available, the API returns a list)
    String capital = '';
    if (json['capital'] != null &&
        json['capital'] is List &&
        json['capital'].isNotEmpty) {
      capital = json['capital'][0] as String;
    }

    // Get continent (API returns a list under "continents")
    String continent = '';
    if (json['continents'] != null &&
        json['continents'] is List &&
        json['continents'].isNotEmpty) {
      continent = json['continents'][0] as String;
    }

    // Return a new Country instance
    return Country(
      name: json['name']['common'] as String,
      capital: capital,
      flagUrl: json['flags']['png'] as String,
      population: json['population'] as int,
      continent: continent,
      countryCode: json['cca2'] as String,
    );
  }
}
