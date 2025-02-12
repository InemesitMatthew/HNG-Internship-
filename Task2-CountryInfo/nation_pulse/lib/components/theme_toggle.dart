import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
/// Builds an icon button that toggles the app's theme between light and dark modes.
///
/// The icon displayed on the button depends on the current theme:
/// - If the current theme is dark, a sun icon is shown to indicate the option to switch to light mode.
/// - If the current theme is light, a moon icon is shown to indicate the option to switch to dark mode.
///
/// When the button is pressed, the `toggleTheme` method of the `ThemeProvider` is called to switch the theme.
///
/// Uses:
/// - `Provider.of<ThemeProvider>` to access the current theme state.
/// - `IconButton` to create the toggle button.
///
/// Returns:
/// An `IconButton` widget configured with the appropriate icon and action.

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
