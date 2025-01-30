import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/link_tiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Function to launch URLs without unnecessary checks
  // It takes a string URL, parses it into a Uri object, and attempts to open it
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    // Check if the URL can be launched, otherwise throw an exception
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // App bar with a title
        appBar: AppBar(
          title: const Text('Tap2Git - HNG Internship'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description text for the app
              const Text(
                'Tap2Git - A simple app to access GitHub and HNG Developer Links.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20), // Spacing

              // List tile for the GitHub repository link
              LinkTiles(
                title: 'View GitHub Repository',
                icon: Icons.link_outlined,
                onTap: () => _launchURL(
                    'https://github.com/InemesitMatthew/HNG-Internship-/tree/main/Task0-GitSetup'),
              ),

              // List tile for the HNG Developer page link
              LinkTiles(
                title: 'HNG Developer Links',
                icon: Icons.link_outlined,
                onTap: () =>
                    _launchURL('http://hng.tech/hire/flutter-developers'),
              ),
            ],
          ),
        ));
  }
}
