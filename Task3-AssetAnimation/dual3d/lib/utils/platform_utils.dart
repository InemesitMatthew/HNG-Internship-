import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef KeyHandler = void Function();

// Utility class to handle platform-specific keyboard events
class PlatformUtils {
  static KeyHandler? _onLeftKey;
  static KeyHandler? _onRightKey;
  static KeyHandler? _onSpaceKey;

  // Function to set keyboard handlers for left, right, and space keys
  static bool isDesktopPlatform(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.macOS ||
        Theme.of(context).platform == TargetPlatform.windows ||
        Theme.of(context).platform == TargetPlatform.linux;
  }

  // Function to set keyboard handlers for left, right, and space keys
  static void setupKeyboardHandlers({
    required KeyHandler? onLeftKey,
    required KeyHandler? onRightKey,
    required KeyHandler? onSpaceKey,
  }) {
    _onLeftKey = onLeftKey;
    _onRightKey = onRightKey;
    _onSpaceKey = onSpaceKey;

    ServicesBinding.instance.keyboard.addHandler(_handleKeyPress);
  }

  // Function to dispose keyboard handlers
  static void disposeKeyboardHandlers() {
    ServicesBinding.instance.keyboard.removeHandler(_handleKeyPress);
    _onLeftKey = null;
    _onRightKey = null;
    _onSpaceKey = null;
  }

  // Function to handle key press events
  static bool _handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft && _onLeftKey != null) {
        _onLeftKey!();
        return true;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight && _onRightKey != null) {
        _onRightKey!();
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.space && _onSpaceKey != null) {
        _onSpaceKey!();
        return true;
      }
    }
    return false;
  }
}
