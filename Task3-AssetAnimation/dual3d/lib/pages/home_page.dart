import 'package:flutter/material.dart';
import '../components/theme_toggle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dual 3D'),
        actions: const [
          ThemeToggle(),
        ],
      ),
    );
  }
}