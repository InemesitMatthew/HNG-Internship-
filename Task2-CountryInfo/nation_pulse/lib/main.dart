import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
