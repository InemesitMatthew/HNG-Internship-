import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../controllers/model_controller.dart';

class ModelViewerContainer extends StatelessWidget {
  final ModelController controller;

  const ModelViewerContainer({
    super.key,
    required this.controller,
  });

  // Build a ModelViewer widget with the current model source and camera orbit.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ModelViewer(
              src: controller.currentModelSrc,
              autoRotate: false,
              autoPlay: false,
              ar: false,
              cameraOrbit: controller.cameraOrbit,
              cameraControls: true,
              animationName: controller.currentAnimationName,
            ),
            if (controller.currentAnimationName != null)
              Positioned(
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${controller.currentCategory}: ${controller.currentAnimationName}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
