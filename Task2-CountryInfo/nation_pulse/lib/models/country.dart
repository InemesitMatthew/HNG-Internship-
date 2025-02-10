class Country {
  final String name;
  final String flagUrl;

  Country({
    required this.name,
    required this.flagUrl,
  });
  
  // Assuming the API returns JSON with a structure similar to:
  // { "name": { "common": "Afghanistan" }, "flags": { "png": "https://.../af.png" } }
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] as String,
      flagUrl: json['flags']['png'] as String,
    );
  }
}
