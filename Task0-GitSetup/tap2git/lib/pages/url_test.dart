import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTestPage extends StatelessWidget {
  const UrlTestPage({super.key});

  // Function to launch URLs without unnecessary checks
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap2Git - HNG Internship')),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example usage
            ElevatedButton(
              onPressed: () => _launchURL('https://www.google.com'),
              child: const Text('Open Google'),
            ),
          ],
        ),
      ),
    );
  }
}
