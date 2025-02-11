class Country {
  final String name;
  final String flagUrl;
  final String capital;

  Country({
    required this.name,
    required this.flagUrl,
    required this.capital
  });

  // Factory constructor adjusted based on the API response:
  // - "name" is a plain string, not a map
  // - We'll construct the flag URL using the "iso2" code.
   factory Country.fromJson(Map<String, dynamic> json) {
    // Construct the flag URL from iso2 using a flag CDN.
    // For example, for iso2 "AF", the URL becomes "https://flagcdn.com/w320/af.png"
    final String iso2 = (json['iso2'] as String).toLowerCase();
    final String flagUrl = 'https://flagcdn.com/w320/$iso2.png';

    return Country(
      name: json['name'] as String,
      flagUrl: flagUrl,
      capital: json['capital'] as String
    );
  }
}
