import 'package:flutter/material.dart';
import '../models/filter.dart';
import '../models/language.dart';

class AppProvider extends ChangeNotifier {
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
    'GMT+1:00',
    'GMT+2:00',
    'GMT+3:00',
    'GMT+4:00',
    'GMT+5:00',
    'GMT+6:00',
  ];

  String get selectedLanguage => _selectedLanguage;
  List<Language> get languages => _languages;
  Filter get filter => _filters;

  /// Sets the selected language to [code] and notifies listeners.
  ///
  /// The selected language is used to determine the language of the application.
  ///
  void setLanguage(String code) {
    _selectedLanguage = code;
    notifyListeners();
  }

  /// Toggles the selection of a continent in the current filter.
  ///
  /// If [continent] is already selected, it will be removed from the selection.
  /// Otherwise, it will be added to the selection.
  /// After updating the selection, listeners are notified.

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
    notifyListeners();
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
    notifyListeners();
  }

  /// Resets the filter to its initial state.
  void resetFilters() {
    _filters = Filter(selectedContinents: [], selectedTimeZones: []);
    notifyListeners();
  }
}
