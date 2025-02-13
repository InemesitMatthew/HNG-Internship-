import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import '../models/country.dart';

class ApiService {
  // Updated base URL for the new API version.
  static const String baseUrl = 'https://restcountries.com/v3.1';

  // Updated endpoint for fetching all countries.
  static const String allCountriesEndpoint = '/all';

  // initialize a logger for this class.
  static final Logger _logger = Logger('ApiService');

  /// Fetches a list of countries from the API.
  ///
  /// Constructs a URL using the base URL and endpoint defined in the class,
  /// sends a GET request, and expects a JSON response that is parsed into a
  /// list of `Country` objects. The list is sorted alphabetically by country
  /// name before being returned.
  ///
  /// Logs the response status code and body for debugging purposes.
  ///
  /// Throws an exception if the response status code is not 200.
  ///
  /// Returns a future that resolves to a list of `Country` objects.

  static Future<List<Country>> fetchCountries() async {
    // Construct the URL for the API request
    const String url = '$baseUrl$allCountriesEndpoint';

    // Send the GET request with the API key in the header.
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json', // Ensures JSON response
      },
    );

    // Log response details
    _logger.info('Response status code: ${response.statusCode}');
    _logger.info('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Since the new API returns a JSON array directly:
      final List<dynamic> data = jsonDecode(response.body);
      List<Country> countries =
          data.map((json) => Country.fromJson(json)).toList();

      // Sort countries alphabetically by name.
      countries.sort((a, b) => a.name.compareTo(b.name));
      return countries;
    } else {
      throw Exception('Failed to load countries: ${response.statusCode}');
    }
  }
}
