import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override

  /// A widget that displays a list of languages to select from.
  ///
  /// It uses `Consumer` to get the list of languages and the selected language
  /// from the `AppProvider`.
  ///
  /// The widget displays a header with the text 'Select a language', followed
  /// by a list of languages. Each language is represented by a `RadioListTile`
  /// with the language name as the title and the language code as the value.
  ///
  /// When the user selects a language, the `onChanged` callback is called with
  /// the selected language code. The callback calls `setLanguage` on the
  /// `AppProvider` to update the selected language and then pops the sheet.
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select a language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.languages.length,
                  itemBuilder: (context, index) {
                    final language = provider.languages[index];
                    return RadioListTile(
                      title: Text(language.name),
                      value: language.code,
                      groupValue: provider.selectedLanguage,
                      onChanged: (value) {
                        provider.setLanguage(value!);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
