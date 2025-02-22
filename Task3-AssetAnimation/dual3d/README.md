Dual 3D
========

Overview:
---------
Dual 3D is a cross-platform Flutter application that displays two 3D avatars (male and female) with interactive animations. Users can select and trigger animations from organized categories (Idle, Dance, Expressions, Movement) via a modal sheet. The app supports both mobile (on-screen controls 📱) and desktop (keyboard controls ⌨️) interactions. 🚀

Features:
---------
• 3D Asset Display: Loads two GLB models (male and female) with proper scaling and positioning.  
• Animation Library: Structured animation categories for male and female (Idle, Dance, Expressions, Movement).  
• Interactive Animation Trigger: Tap the selector to choose an animation which plays for a set duration (e.g., 8 seconds) before reverting to idle.  
• Platform-Specific Controls:  
  - Mobile: On-screen buttons for rotation and jump.  
  - Desktop: Use arrow keys for rotation and the space bar for jump.  
• Dynamic Camera Orbit: Updates the view based on user-controlled rotation.

Installation:
-------------
1. Clone the Repository:  
  • git clone <https://github.com/InemesitMatthew/HNG-Internship-/tree/main/Task3-AssetAnimation/dual3d>  
  • cd dual3d

2. Install Dependencies:  
  • Ensure you have Flutter installed.  
  • Run: flutter pub get

3. Asset Setup:  
  • Base models should be placed in:  
   - lib/assets/models/male.glb  
   - lib/assets/models/female.glb  
  • Animation files should be organized in directories such as:  
   - lib/assets/animations/feminine/dance/  
   - lib/assets/animations/feminine/idle/  
   - lib/assets/animations/feminine/expression/  
   - lib/assets/animations/feminine/locomotion/  
   - (and the corresponding masculine directories)  
  • In pubspec.yaml, list the directories (wildcards are not supported) ⚠️

4. Enable Desktop Support (Optional):  
  • For Windows: flutter config --enable-windows-desktop  
  • For macOS: flutter config --enable-macos-desktop  
  • For Linux: flutter config --enable-linux-desktop

Running the App:
----------------
• Mobile: Run on your device/emulator with:  
  flutter run 📱

• Desktop: Run on your desktop with:  
  flutter run -d windows   (or macos/linux as needed) 🖥️

Usage:
------
• Animation Selection:  
  - Tap the animation selector above each avatar to open a modal sheet.  
  - Choose a category and then a specific animation.  
  - The selected animation plays for a preset duration before reverting to the idle state.

• Controls:  
  - Mobile: Use on-screen buttons to rotate the model (left/right) or trigger a jump.  
  - Desktop:  
   • Use left/right arrow keys to rotate.  
   • Press the space bar to trigger a jump.

Project Structure:
------------------
• lib/controllers: Contains ModelController which manages animation state, GLB source switching, and camera orbit.  
• lib/components: UI components like ModelViewerContainer, AnimationCategorySelector, and ThemeToggle.  
• lib/data: Structured animation library (animation_data.dart).  
• lib/models: Data models for animation categories and items.  
• lib/screens: Contains the HomePage widget.  
• lib/utils: Utility functions for platform detection and string manipulation.  
• lib/assets: Contains GLB files for models and animations, organized into the appropriate directories.

Troubleshooting:
----------------
• Asset Bundling:  
  - Ensure your pubspec.yaml lists directories (not wildcards) for asset inclusion.  
• Animation Playback:  
  - Confirm that your GLB files are correctly formatted and include embedded animations.  
• Platform Controls:  
  - If desktop keyboard events do not work, verify that desktop support is enabled and keyboard handlers are set up correctly.
