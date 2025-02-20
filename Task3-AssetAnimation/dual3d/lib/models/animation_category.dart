class AnimationCategory {
  final String name;
  final String path;
  final List<AnimationItem> animations;

  AnimationCategory({
    required this.name,
    required this.path,
    required this.animations,
  });
}

class AnimationItem {
  final String name;
  final String fileName;
  final Duration duration;

  AnimationItem({
    required this.name,
    required this.fileName,
    this.duration = const Duration(seconds: 8),
  });
}
