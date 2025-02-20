import 'package:flutter/material.dart';
import '../models/animation_category.dart';
import '../data/animation_data.dart';
import '../controllers/model_controller.dart';
import '../utils/string_utils.dart';

class AnimationCategorySelector extends StatelessWidget {
  final ModelController controller;

  const AnimationCategorySelector({
    super.key,
    required this.controller,
  });

  // Display a popup menu button with the available animation categories.
  @override
  Widget build(BuildContext context) {
    final categories = controller.modelType == 'male'
        ? AnimationLibrary.maleAnimations
        : AnimationLibrary.femaleAnimations;
    return PopupMenuButton<AnimationCategory>(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.currentCategory != null
                    ? '${controller.modelType.capitalize()} : ${controller.currentAnimationName}'
                    : '${controller.modelType.capitalize()} : Animations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      onSelected: (category) {
        _showAnimationList(context, category);
      },
      itemBuilder: (context) => categories.map((category) {
        return PopupMenuItem<AnimationCategory>(
          value: category,
          child: Text(category.name),
        );
      }).toList(),
    );
  }

  // Display a bottom sheet with a list of animations for the selected category.
  void _showAnimationList(BuildContext context, AnimationCategory category) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${controller.modelType.capitalize()} : ${category.name} Animations',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: category.animations.length,
                itemBuilder: (context, index) {
                  final animation = category.animations[index];
                  return ListTile(
                    title: Text(animation.name),
                    onTap: () {
                      Navigator.pop(context);
                      controller.playAnimation(category, animation);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
