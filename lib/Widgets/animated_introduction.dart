import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meweb/Widgets/type_text_animation_reversed.dart';

class AnimatedIntroduction extends StatefulWidget {
  final List<String> textsForAnimation;
  AnimatedIntroduction({Key? key, required this.textsForAnimation}) : super(key: key);

  @override
  State<AnimatedIntroduction> createState() => _AnimatedIntroductionState();
}

class _AnimatedIntroductionState extends State<AnimatedIntroduction> {
  late List<String> textsForAnimation = widget.textsForAnimation;

  List<AnimatedText> buildAnimatedTexts() {
    List<AnimatedText> textAnimations = [];
    for (var element in textsForAnimation) {
      AnimatedText forwardAnimation = TypewriterAnimatedText(
        element,
        textStyle: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        speed: const Duration(milliseconds: 100),
      );
      AnimatedText reverseAnimation = TypewriterTextAnimation_Reversed(
        element,
        textStyle: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        speed: const Duration(milliseconds: 25),
      );
      textAnimations.add(forwardAnimation);
      textAnimations.add(reverseAnimation);
    }

    return textAnimations;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: Duration(milliseconds: 250),
      animatedTexts: buildAnimatedTexts(),
    );
  }
}
