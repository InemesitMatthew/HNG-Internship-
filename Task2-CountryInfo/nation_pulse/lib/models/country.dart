class Country {
  final String name;
  final String capital;
  final String flagUrl;
  final int population;
  final String continent;
  final String countryCode;
  final String timezone;
  final Map<String, dynamic> languages;

  Country({
    required this.name,
    required this.capital,
    required this.flagUrl,
    required this.population,
    required this.continent,
    required this.countryCode,
    required this.timezone,
    required this.languages,
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

    // Get timezone (API returns a list under "timezones")
    String timezone = '';
    if (json['timezones'] != null &&
        json['timezones'] is List &&
        json['timezones'].isNotEmpty) {
      timezone = json['timezones'][0] as String;
    }

    // Safely extract languages, defaulting to an empty map if null.
    Map<String, String> languages = {};
    if (json['languages'] != null && json['languages'] is Map) {
      languages = Map<String, String>.from(json['languages'] as Map);
    }

    // Return a new Country instance
    return Country(
      name: json['name']['common'] as String,
      capital: capital,
      flagUrl: json['flags']['png'] as String,
      population: json['population'] as int,
      continent: continent,
      countryCode: json['cca2'] as String,
      timezone: timezone,
      languages: languages,
    );
  }
}
