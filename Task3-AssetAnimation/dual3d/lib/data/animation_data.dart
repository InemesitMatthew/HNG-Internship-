import '../models/animation_category.dart';

// This class contains all the animation data for the app.
class AnimationLibrary {
  // DEV NOTE: Collapse each code category for easy readability.
  // male animations
  static final maleAnimations = [
    // male idle
    AnimationCategory(
      name: 'Idle',
      path: 'lib/assets/animations/masculine/idle',
      animations: [
        AnimationItem(
          name: 'Basic Idle',
          fileName: 'M_Standing_Idle_001.glb',
        ),
        AnimationItem(
          name: 'Relaxed Idle',
          fileName: 'M_Standing_Idle_002.glb',
        ),
        AnimationItem(
          name: 'Idle Variation 1',
          fileName: 'M_Standing_Idle_Variations_001.glb',
        ),
        AnimationItem(
          name: 'Idle Variation 2',
          fileName: 'M_Standing_Idle_Variations_002.glb',
        ),
        AnimationItem(
          name: 'Idle Variation 3',
          fileName: 'M_Standing_Idle_Variations_003.glb',
        ),
      ],
    ),

    // male dance
    AnimationCategory(
      name: 'Dance',
      path: 'lib/assets/animations/masculine/dance',
      animations: [
        AnimationItem(name: 'Dance Move 1', fileName: 'M_Dances_001.glb'),
        AnimationItem(name: 'Dance Move 2', fileName: 'M_Dances_002.glb'),
        AnimationItem(name: 'Dance Move 3', fileName: 'M_Dances_003.glb'),
        AnimationItem(name: 'Dance Move 4', fileName: 'M_Dances_004.glb'),
        AnimationItem(name: 'Dance Move 5', fileName: 'M_Dances_005.glb'),
      ],
    ),

    // male expression
    AnimationCategory(
      name: 'Expressions',
      path: 'lib/assets/animations/masculine/expression',
      animations: [
        AnimationItem(
            name: 'Talk Variation 1', fileName: 'M_Talking_Variations_001.glb'),
        AnimationItem(
            name: 'Talk Variation 2', fileName: 'M_Talking_Variations_002.glb'),
        AnimationItem(
            name: 'Expression 1', fileName: 'M_Standing_Expressions_001.glb'),
        AnimationItem(
            name: 'Expression 2', fileName: 'M_Standing_Expressions_002.glb'),
        AnimationItem(
            name: 'Expression 3', fileName: 'M_Standing_Expressions_004.glb'),
      ],
    ),

    // male movement
    AnimationCategory(
      name: 'Movement',
      path: 'lib/assets/animations/masculine/locomotion',
      animations: [
        AnimationItem(name: 'Walk', fileName: 'M_Walk_001.glb'),
        AnimationItem(name: 'Run', fileName: 'M_Run_001.glb'),
        AnimationItem(name: 'Jump', fileName: 'M_Walk_Jump_001.glb'),
        AnimationItem(name: 'Jog', fileName: 'M_Jog_001.glb'),
        AnimationItem(
            name: 'Backwards Walk', fileName: 'M_Walk_Backwards_001.glb'),
      ],
    ),
  ];

  // Female animations
  static final femaleAnimations = [
    // female idle
    AnimationCategory(
      name: 'Idle',
      path: 'lib/assets/animations/feminine/idle',
      animations: [
        AnimationItem(name: 'Basic Idle', fileName: 'F_Standing_Idle_001.glb'),
        AnimationItem(
            name: 'Idle Variation 1',
            fileName: 'F_Standing_Idle_Variations_001.glb'),
        AnimationItem(
            name: 'Idle Variation 2',
            fileName: 'F_Standing_Idle_Variations_002.glb'),
        AnimationItem(
            name: 'Idle Variation 3',
            fileName: 'F_Standing_Idle_Variations_003.glb'),
        AnimationItem(
            name: 'Idle Variation 4',
            fileName: 'F_Standing_Idle_Variations_004.glb'),
      ],
    ),

    // female dance
    AnimationCategory(
      name: 'Dance',
      path: 'lib/assets/animations/feminine/dance',
      animations: [
        AnimationItem(name: 'Dance Move 1', fileName: 'F_Dances_001.glb'),
        AnimationItem(name: 'Dance Move 4', fileName: 'F_Dances_004.glb'),
        AnimationItem(name: 'Dance Move 5', fileName: 'F_Dances_005.glb'),
        AnimationItem(name: 'Dance Move 6', fileName: 'F_Dances_006.glb'),
        AnimationItem(name: 'Dance Move 7', fileName: 'F_Dances_007.glb'),
      ],
    ),

    // female expression
    AnimationCategory(
      name: 'Expressions',
      path: 'lib/assets/animations/feminine/expression',
      animations: [
        AnimationItem(
            name: 'Talk Variation 1', fileName: 'F_Talking_Variations_001.glb'),
        AnimationItem(
            name: 'Talk Variation 2', fileName: 'F_Talking_Variations_002.glb'),
        AnimationItem(
            name: 'Talk Variation 3', fileName: 'F_Talking_Variations_003.glb'),
        AnimationItem(
            name: 'Talk Variation 4', fileName: 'F_Talking_Variations_004.glb'),
        AnimationItem(
            name: 'Talk Variation 5', fileName: 'F_Talking_Variations_005.glb'),
      ],
    ),

    // female movement
    AnimationCategory(
      name: 'Movement',
      path: 'lib/assets/animations/feminine/locomotion',
      animations: [
        AnimationItem(name: 'Walk', fileName: 'F_Walk_002.glb'),
        AnimationItem(name: 'Run', fileName: 'F_Run_001.glb'),
        AnimationItem(name: 'Jump', fileName: 'F_Walk_Jump_001.glb'),
        AnimationItem(name: 'Jog', fileName: 'F_Jog_001.glb'),
        AnimationItem(
            name: 'Backwards Walk', fileName: 'F_Walk_Backwards_001.glb'),
      ],
    ),
  ];
}
