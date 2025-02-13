# 🌍 Nation Pulse

## 📌 Overview
Nation Pulse is a beautifully designed Flutter app that lets users explore comprehensive details about countries worldwide! 🏛️ From capital cities to timezones, flags, and populations, this app provides an immersive experience with real-time country data in an intuitive interface. 🛠️

## ✨ Features
- 🌎 **Country List** – Browse a list of all countries with their flags and names.
- 🔎 **Search Functionality** – Instantly find any country by typing its name.
- 📜 **Detailed Country Info** – View key data, including:
  - 🏙️ Capital
  - 👥 Population (Formatted for easy reading)
  - 🌍 Continent
  - 📞 Country Code
  - ⏰ Timezone (With separate styling for better clarity!)
- 🌗 **Theme Toggle** – Switch effortlessly between light and dark mode.
- 🔄 **Pull-to-Refresh** – Update country data dynamically by pulling down the list.

## 🏗️ Technologies Used
- 🚀 **Flutter (Dart)** – The powerhouse framework behind the app.
- 🎨 **Google Fonts** – Adds sleek typography.
- 🌐 **HTTP Package** – Fetches live API data.
- 🔢 **Intl Package** – Ensures proper number formatting.
- 📦 **Provider** – Handles efficient state management.

## 🛠️ Installation and Setup

### 📌 Prerequisites
Ensure you have the following installed:
- 📌 **Flutter SDK**
- 📌 **Dart**
- 📌 **Android Studio / VS Code** (with Flutter plugins)

### 🚀 Steps to Run the Project
1. **Clone the Repository** 📥
   ```sh
   git clone https://github.com/InemesitMatthew/NationPulse.git
   cd NationPulse
   ```
2. **Install Dependencies** 🛠️
   ```sh
   flutter pub get
   ```
3. **Run the App** ▶️
   ```sh
   flutter run
   ```

## 📖 Usage Instructions
- 🏠 **Launch the App** – The home screen showcases the country list.
- 🔍 **Search for a Country** – Type in the search bar to quickly find a country.
- 📋 **View Country Details** – Tap on any country for an in-depth overview.
- 🌗 **Switch Theme** – Toggle between light/dark mode with the top-right button.
- 🔄 **Refresh Data** – Pull down the list to get the latest updates.

## 📂 App Structure
```
lib/
├── components/
│   ├── theme_toggle.dart  # Widget to toggle theme
│   └── country_card.dart  # Displays country name and flag
│
├── models/
│   └── country.dart  # Defines the Country model
│
├── pages/
│   ├── home_page.dart  # Displays the list of countries
│   ├── country_page.dart  # Shows detailed information for a selected country
│
├── providers/
│   ├── theme_provider.dart  # Handles theme switching
│
├── services/
│   ├── api_service.dart  # Fetches country data from the API
│
└── main.dart  # App entry point
```

## 🔥 Code Highlights
### 🌐 Fetching Country Data (API Service)
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  static Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load country data');
    }
  }
}
```

### 🎨 Styling Country Details with RichText (for Separate Colors)
```dart
Widget buildDetailItem({
  required String label,
  required String value,
  Color? labelColor,
  Color? valueColor,
}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$label: ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: labelColor ?? Colors.blue),
        ),
        TextSpan(
          text: value,
          style: TextStyle(fontSize: 20, color: valueColor ?? Colors.black),
        ),
      ],
    ),
  );
}
```

## 🤝 Contribution Guidelines
We welcome all contributors! 🚀
1. **Fork the repository** 🔀
2. **Create a new branch** 🛤️ for your feature.
3. **Commit your changes** with clear messages.
4. **Submit a pull request** 📩

## 📜 License
This project is open-source and available under the MIT License.

---
📲 **Nation Pulse – Your Ultimate Guide to the World! 🌍**
----------------------------------
**Discover, Explore, and Learn About Countries Worldwide with Nation Pulse.**