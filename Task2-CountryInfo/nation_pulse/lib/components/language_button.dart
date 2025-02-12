import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'language_sheet.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override

  /// Builds a widget that displays an `ElevatedButton` with a language icon and
  /// the currently selected language as its label. The button is styled using
  /// the current theme's color scheme. When pressed, it triggers the display of
  /// a language selection sheet through `_showLanguageSheet`.
  ///
  /// The button uses a `Consumer` to access the `AppProvider`, which provides
  /// the selected language to be displayed on the button.

  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        icon: Icon(
          Icons.language_rounded,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        label: Text(
          provider.selectedLanguage, // Display the selected language
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        onPressed: () => _showLanguageSheet(context),
      ),
    );
  }

  /// A function that displays a bottom sheet with a list of languages to select from.
  ///
  /// It uses `showModalBottomSheet` to display the sheet and `RoundedRectangleBorder`
  /// to give it a rounded top border. The sheet displays a `LanguageSheet` widget.
  ///
  /// The function takes a `BuildContext` as an argument, which is used to determine
  /// the parent widget for the sheet.
  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => const LanguageSheet(),
    );
  }
}
