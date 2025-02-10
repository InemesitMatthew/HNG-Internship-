import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import '../models/country.dart';

class ApiService {
  // Base URL for the API
  static const String baseUrl = 'https://restfulcountries.com/api/v1';
  // Endpoint for fetching all countries
  static const String allCountriesEndpoint = '/countries';
  // API key provided
  static const String apiKey = '2115|EsRRBNEpnXJH3rEB4fX7q1xvgIE2QaZKoftSFN3J';

  // initialize a logger for this class.
  static final Logger _logger = Logger('ApiService');

  static Future<List<Country>> fetchCountries() async {
    // Construct the URL for the API request
    const String url = '$baseUrl$allCountriesEndpoint';

    // Send the GET request with the API key in the header.
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
       // Log the raw JSON response (for debugging)
      _logger.info('Response body: ${response.body}');
      
      final List<dynamic> data = jsonDecode(response.body);
      // Parse each JSON object into a country instance.
      List<Country> countries =
          data.map((json) => Country.fromJson(json)).toList();

      // Sort countries alpjabetically by name.
      countries.sort((a, b) => a.name.compareTo(b.name));
      return countries;
    } else {
      throw Exception('Failed to load countries: ${response.statusCode}');
    }
  }
}
