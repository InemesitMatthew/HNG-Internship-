import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Male Animation Button

                // Female Animation Button
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ModelViewer(
                      src: "lib/images/male.glb",
                      autoRotate: false,
                    ),
                  ),
                  Expanded(
                    child: ModelViewer(
                      src: "lib/images/female.glb",
                      autoRotate: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
