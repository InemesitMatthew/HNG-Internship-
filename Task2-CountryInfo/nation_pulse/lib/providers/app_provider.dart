import 'package:flutter/material.dart';
import '../models/country.dart';
import '../models/filter.dart';
import '../models/language.dart';
import '../services/api_service.dart';

class AppProvider extends ChangeNotifier {
  // Language Management
  String _selectedLanguage = 'EN'; // Default language is English
  // List of languages supported by the application
  final List<Language> _languages = [
    Language(code: 'EN', name: 'English'),
    Language(code: 'FR', name: 'French'),
    Language(code: 'ES', name: 'Spanish'),
    Language(code: 'DE', name: 'German'),
    Language(code: 'IT', name: 'Italian'),
    Language(code: 'RU', name: 'Russian'),
    Language(code: 'AR', name: 'Arabic'),
    Language(code: 'ZH', name: 'Chinese'),
    Language(code: 'JA', name: 'Japanese'),
    Language(code: 'KO', name: 'Korean'),
  ];

  // Filter Management
  // Filter object to store the selected continents and time zones
  Filter _filters = Filter(selectedContinents: [], selectedTimeZones: []);

  // List of continents
  final List<String> continents = [
    'Africa',
    'Antarctica',
    'Asia',
    'Australia',
    'Europe',
    'North America',
    'Oceania',
    'South America',
  ];

  // List of time zones
  final List<String> timeZones = [
    'UTC+01:00',
    'UTC+02:00',
    'UTC+03:00',
    'UTC+04:00',
    'UTC+05:00',
    'UTC+06:00',
    'UTC+07:00',
    'UTC+08:00',
    'UTC+09:00',
    'UTC+10:00',
    'UTC+11:00',
    'UTC+12:00',
    'UTC-01:00',
    'UTC-02:00',
    'UTC-03:00',
    'UTC-04:00',
    'UTC-05:00',
    'UTC-06:00',
    'UTC-07:00',
    'UTC-08:00',
    'UTC-09:00',
    'UTC-10:00',
    'UTC-11:00',
    'UTC-12:00',
  ];

  // Search & Countries Management
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];
  String _searchQuery = '';
  bool _isLoading = false;
  String? _error;

  // Getters
  String get selectedLanguage => _selectedLanguage;
  List<Language> get languages => _languages;
  Filter get filter => _filters;
  List<Country> get filteredCountries => _filteredCountries;
  bool get isLoading => _isLoading;
  String? get error => _error;

  AppProvider() {
    _initializeData();
  }

  /// Initializes the application data by fetching the list of countries from the API and applying the current filter.
  ///
  /// This function notifies listeners that the data is being loaded, fetches the list of countries,
  /// applies the current filter, and then notifies listeners that the data has been loaded.
  /// If there is an error while loading the data, it sets the error message and notifies listeners.
  ///
  /// This function is called once when the application is initialized.
  Future<void> _initializeData() async {
    try {
      _isLoading = true;
      notifyListeners();

      _allCountries = await ApiService.fetchCountries();
      _applyFilters();

      _isLoading = false;
      _error = null;
    } catch (e) {
      _error = 'Failed to load countries: $e';
      _isLoading = false;
    }
  }

  /// Sets the selected language to [code] and notifies listeners.
  ///
  /// The selected language is used to determine the language of the application.
  ///
  void setLanguage(String code) {
    _selectedLanguage = code;
    notifyListeners();
  }

  /// Toggles the selection of a continent in the current filter.
  //
  /// If [continent] is already selected, it will be removed from the selection.
  /// Otherwise, it will be added to the selection.
  /// After updating the selection, the filter is re-applied, and listeners are
  /// notified.
  void toggleContinent(String continent) {
    final continents = List<String>.from(_filters.selectedContinents);
    if (continents.contains(continent)) {
      continents.remove(continent);
    } else {
      continents.add(continent);
    }
    _filters = Filter(
        selectedContinents: continents,
        selectedTimeZones: _filters.selectedTimeZones);
    _applyFilters();
  }

  /// Toggle whether [timeZone] is selected in the current filter.
  ///
  /// If [timeZone] is already selected, it will be deselected.
  /// If [timeZone] is not selected, it will be selected.
  ///
  /// Calling this method will notify all listeners.
  ///
  /// [timeZone] should be one of the following:
  /// * 'GMT+1:00'
  /// * 'GMT+2:00'
  /// * 'GMT+3:00'
  /// * 'GMT+4:00'
  /// * 'GMT+5:00'
  /// * 'GMT+6:00'
  void toggleTimeZone(String timeZone) {
    final timeZones = List<String>.from(_filters.selectedTimeZones);
    if (timeZones.contains(timeZone)) {
      timeZones.remove(timeZone);
    } else {
      timeZones.add(timeZone);
    }
    _filters = Filter(
      selectedContinents: _filters.selectedContinents,
      selectedTimeZones: timeZones,
    );
    _applyFilters();
  }

  /// Resets the filter to its initial state.
  void resetFilters() {
    _filters = Filter(selectedContinents: [], selectedTimeZones: []);
    notifyListeners();
  }

  /// Updates the search query and re-applies the filters to the list of all
  /// countries. This will update the list of filtered countries and notify all
  /// listeners.
  ///
  /// The search query is case-insensitive and is matched against the names and
  /// capitals of the countries. If the search box is empty, no search filter is
  /// applied.
  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilters();
  }

  /// Applies the current search query and filter settings to the list of all
  /// countries and updates the list of filtered countries.
  ///
  /// The following filters are applied:
  ///
  /// * The search query is applied to the names and capitals of the countries.
  ///   If the search box is empty, this filter is not applied.
  /// * The selected continents are applied to the list of countries.
  ///   If no continents are selected, this filter is not applied.
  /// * The selected timezones are applied to the list of countries.
  ///   If no timezones are selected, this filter is not applied.
  ///
  /// Finally, the list of filtered countries is updated and all listeners are
  /// notified.
  void _applyFilters() {
    var filtered = List<Country>.from(_allCountries);

    // Apply search filter
    // If search box isn't empty
    if (_searchQuery.isNotEmpty) {
      // Take the current list (filtered) and apply .where() function
      filtered = filtered
          .where((country) =>
              // For each country, check if either:
              country.name
                  .toLowerCase()
                  .contains(_searchQuery) || // name contains search text
              country.capital
                  .toLowerCase()
                  .contains(_searchQuery)) // OR capital contains search text
          .toList(); // Convert back to list
    }

    // Apply continent filter
    if (_filters.selectedContinents.isNotEmpty) {
      // Take the current list (filtered) and apply .where() function
      filtered = filtered
          .where((country) =>
              _filters.selectedContinents.contains(country.continent))
          .toList();
    }

    // Apply timezone filter
    if (_filters.selectedTimeZones.isNotEmpty) {
      // Take the current list (filtered) and apply .where() function
      filtered = filtered
          .where((country) =>
              _filters.selectedTimeZones.contains(country.timezone))
          .toList();
    }

    // Apply language filter.
    // Map the selected language (e.g., "EN") to the API's language key (e.g., "eng").
    String apiLanguageKey;
    switch (_selectedLanguage) {
      case 'EN':
        apiLanguageKey = 'eng';
        break;
      case 'FR':
        apiLanguageKey = 'fra';
        break;
      case 'ES':
        apiLanguageKey = 'spa';
        break;
      case 'DE':
        apiLanguageKey = 'deu';
        break;
      case 'IT':
        apiLanguageKey = 'ita';
        break;
      case 'RU':
        apiLanguageKey = 'rus';
        break;
      case 'AR':
        apiLanguageKey = 'ara';
        break;
      case 'ZH':
        apiLanguageKey = 'zho';
        break;
      case 'JA':
        apiLanguageKey = 'jpn';
        break;
      case 'KO':
        apiLanguageKey = 'kor';
        break;
      default:
        apiLanguageKey = '';
    }
    if (apiLanguageKey.isNotEmpty) {
      filtered = filtered
          .where((country) => country.languages.containsKey(apiLanguageKey))
          .toList();
    }

    _filteredCountries = filtered;
    notifyListeners();
  }

  // Refresh the data by re-fetching the list of countries from the API
  Future<void> refreshData() => _initializeData();
}
