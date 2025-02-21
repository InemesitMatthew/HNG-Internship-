import 'package:flutter/material.dart';
import '../components/model_viewer_container.dart';
import '../components/animation_category_selector.dart';
import '../components/theme_toggle.dart';
import '../controllers/model_controller.dart';
import '../data/animation_data.dart';
import '../utils/platform_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ModelController maleController;
  late final ModelController femaleController;
  late bool isDesktop;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with their type and base model path.
    maleController = ModelController(
      modelType: 'male',
      baseModelPath: "lib/assets/models/male.glb",
    );
    femaleController = ModelController(
      modelType: 'female',
      baseModelPath: "lib/assets/models/female.glb",
    );

    // Delay reading the platform from context until after first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isDesktop = PlatformUtils.isDesktopPlatform(context);
      });
      if (isDesktop) {
        PlatformUtils.setupKeyboardHandlers(
          onLeftKey: () => maleController.rotateModel(-15),
          onRightKey: () => maleController.rotateModel(15),
          onSpaceKey: () => _playDefaultJumpAnimation(),
        );
      }
    });
  }

  // Play the default jump animation for the model.
  void _playDefaultJumpAnimation() {
    // Find the jump animation in the male movement category and play it.
    final movementCategory = AnimationLibrary.maleAnimations.firstWhere(
      (category) => category.name == 'Movement',
    );
    final jumpAnimation = movementCategory.animations.firstWhere(
      (animation) => animation.name == 'Jump',
    );
    maleController.playAnimation(movementCategory, jumpAnimation);
  }

// Dispose controllers and keyboard handlers on dispose.
  @override
  void dispose() {
    maleController.dispose();
    femaleController.dispose();
    if (isDesktop) {
      PlatformUtils.disposeKeyboardHandlers();
    }
    super.dispose();
  }

  // Build the home page with the 3D models and animation controls.
  @override
  Widget build(BuildContext context) {
    final desktop = PlatformUtils.isDesktopPlatform(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dual 3D'),
        actions: const [ThemeToggle()],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // Animation control buttons for each model.
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimationCategorySelector(controller: maleController),
                AnimationCategorySelector(controller: femaleController),
              ],
            ),
          ),
          // Display the 3D models.
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: ModelViewerContainer(controller: maleController)),
                Expanded(
                    child: ModelViewerContainer(controller: femaleController)),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Mobile-specific controls.
          if (!desktop)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => maleController.rotateModel(-15),
                    tooltip: 'Rotate left',
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: _playDefaultJumpAnimation,
                    icon: const Icon(Icons.arrow_upward_rounded),
                    tooltip: 'Jump',
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () => maleController.rotateModel(15),
                    tooltip: 'Rotate right',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
