import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme provider from the context
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Determine which icon to show:
    // If the current theme is dark, show the sun icon to indicate switching to light mode.
    // Otherwise, show the moon icon to indicate switching to dark mode.
    final isDarkMode = themeProvider.isDarkMode;
    final icon =
        isDarkMode ? Icons.wb_sunny_rounded : Icons.nights_stay_rounded;

    // Call the toggleTheme method to switch the theme when the icon is tapped.
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        // Toggle the theme when pressed
        themeProvider.toggleTheme();
      },
    );
  }
}
