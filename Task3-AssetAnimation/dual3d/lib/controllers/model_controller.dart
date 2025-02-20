// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import '../models/animation_category.dart';


// ModelController is a ChangeNotifier that controls the state of a 3D model.
// It can change the model source, play animations, and rotate the model.
class ModelController extends ChangeNotifier {
  final String modelType; // 'male' or 'female'
  final String baseModelPath;
  late String _currentModelSrc;
  String get currentModelSrc => _currentModelSrc;

  String? currentAnimationName;
  String? currentCategory;

  // We'll control the camera orbit (for rotation) via a string
  String cameraOrbit;

  Timer? _animationTimer;

  ModelController({
    required this.modelType,
    required this.baseModelPath,
    this.cameraOrbit = "0deg 75deg 2m",
  }) : _currentModelSrc = baseModelPath;

  void playAnimation(AnimationCategory category, AnimationItem animation) {
    // Cancel any running animation timer.
    _animationTimer?.cancel();

    currentCategory = category.name;
    currentAnimationName = animation.name;

    // Construct the full animation path (assuming GLB animations)
    final animationPath = '${category.path}/${animation.fileName}';
    _currentModelSrc = animationPath;
    notifyListeners();

    // Reset back to the base model after the animation duration.
    _animationTimer = Timer(animation.duration, () {
      _currentModelSrc = baseModelPath;
      currentAnimationName = null;
      currentCategory = null;
      notifyListeners();
    });
  }

  void rotateModel(double angle) {
    // Simple logic to update the horizontal angle in the cameraOrbit string.
    // Assume cameraOrbit is in the format "Xdeg 75deg 2m".
    final parts = cameraOrbit.split(" ");
    if (parts.isNotEmpty) {
      try {
        final currentAngleStr = parts[0].replaceAll("deg", "");
        final currentAngle = double.parse(currentAngleStr);
        final newAngle = currentAngle + angle;
        parts[0] = "${newAngle}deg";
        cameraOrbit = parts.join(" ");
        notifyListeners();
      } catch (e) {
        print("Error rotating model: $e");
      }
    }
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }
}
