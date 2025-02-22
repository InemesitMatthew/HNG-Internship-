// Mr Alis code
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Flutter3DController controller = Flutter3DController();
  List<String> animations = [];
  String? activeAnimation;

  // This will fetch all the available animations of your model
  Future<void> _fetchAnimations() async {
    final availableAnimations = await controller.getAvailableAnimations();
    setState(() {
      animations = availableAnimations;
    });
  }

  void setActiveAnimation(String animation) {
    setState(() {
      activeAnimation = animation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '3D Model Controller',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Flutter3DViewer(
        activeGestureInterceptor: true,
        progressBarColor: Colors.orange,
        enableTouch: true,
        onProgress: (double progressValue) {},
        onLoad: (String modelAddress) => _fetchAnimations(),
        onError: (String error) {},
        controller: controller,
        // Set your animation in src. URL or from asset
        src: 'lib/assets/test/business_man.glb',
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.pause),
        onPressed: () => controller.pauseAnimation(),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(20),
          children: animations.map((animation) {
            bool isActive = activeAnimation == animation;
            return GestureDetector(
              onTap: () {
                controller.playAnimation(animationName: animation);
                setActiveAnimation(animation);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Chip(
                  backgroundColor: isActive ? Colors.black87 : null,
                  label: Text(
                    animation.substring(4).toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isActive ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
