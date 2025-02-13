import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/country.dart';
import 'pages/country_page.dart';
import 'pages/home_page.dart';
import 'providers/app_provider.dart';
import 'themes/theme_provider.dart';
import 'package:logging/logging.dart';

/// The main entry point for the app.
///
/// Configures the root logger to print all log messages to the console, and
/// sets up the app's providers and runs the app.
///
/// The providers are:
/// - A [ThemeProvider], which provides the app's theme.
/// - An [AppProvider], which provides the app's language and filter.
///
/// The app is then run with the [MyApp] widget as its root widget.
void main() async {
  // Logger is used to print log messages to the console
  // Configure logging output
  Logger.root.level = Level.ALL; // Set the log level to display all messages
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(MultiProvider(
    providers: [
      // Theme provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),

      // Language and Filter provider
      ChangeNotifierProvider(
        create: (context) => AppProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// Builds the app's material design widget tree.
  ///
  /// The app's widget tree consists of a [MaterialApp] widget with a
  /// [MaterialPageRoute] for the home page and a [MaterialPageRoute] for each
  /// country page.
  ///
  /// The app's theme is provided by the [ThemeProvider].
  ///
  /// The [onGenerateRoute] callback is used to handle routes that require
  /// parameters, such as the country page.
  ///
  /// For any undefined routes, the app falls back to the home page.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
      // Use onGenerateRoute to handle routes that require parameters.
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
          case '/country_page':
            // Expecting a country object as argument.
            final args = settings.arguments;
            if (args is Country) {
              return MaterialPageRoute(
                builder: (context) => CountryPage(country: args),
              );
            }
            // if no valid argument is provided, fallback to home page.
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
          default:
            // For any undefined routes, fallback to home page.
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
        }
      },
    );
  }
}
