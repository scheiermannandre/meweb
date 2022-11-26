import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

/// Animated Text that displays a [Text] element as if it is being typed one
/// character at a time. Similar to [TyperAnimatedText], but shows a cursor.
///
/// ![Typewriter example](https://raw.githubusercontent.com/aagarwal1012/Animated-Text-Kit/master/display/typewriter.gif)
class TypewriterTextAnimation_Reversed extends AnimatedText {
  // The text length is padded to cause extra cursor blinking after typing.
  static const extraLengthForBlinks = 8;

  /// The [Duration] of the delay between the apparition of each characters
  ///
  /// By default it is set to 30 milliseconds.
  final Duration speed;

  /// The [Curve] of the rate of change of animation over time.
  ///
  /// By default it is set to Curves.linear.
  final Curve curve;

  /// Cursor text. Defaults to underscore.
  final String cursor;

  TypewriterTextAnimation_Reversed(
    String text, {
    TextAlign textAlign = TextAlign.start,
    TextStyle? textStyle,
    this.speed = const Duration(milliseconds: 30),
    this.curve = Curves.linear,
    this.cursor = '_',
  }) : super(
          text: text,
          textAlign: textAlign,
          textStyle: textStyle,
          duration: speed * (text.characters.length + extraLengthForBlinks),
        );

  late Animation<double> _typewriterText;

  @override
  Duration get remaining =>
      speed *
      (textCharacters.length + extraLengthForBlinks - _typewriterText.value);

  @override
  void initAnimation(AnimationController controller) {
    _typewriterText = CurveTween(
      curve: curve,
    ).animate(controller);
  }

  @override
  Widget completeText(BuildContext context) => RichText(
        text: TextSpan(
          children: [
            TextSpan(text: ""),
            TextSpan(
              text: cursor,
              style: const TextStyle(color: Colors.transparent),
            )
          ],
          style: DefaultTextStyle.of(context).style.merge(textStyle),
        ),
        textAlign: textAlign,
      );

  /// Widget showing partial text
  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    /// Output of CurveTween is in the range [0, 1] for majority of the curves.
    /// It is converted to [0, textCharacters.length + extraLengthForBlinks].
    // final textLen = textCharacters.length;
    // final totalLen = textCharacters.length * 2;
    // final lenWithBlinks = textLen + extraLengthForBlinks;

    // final typewriterValue =
    //     (_typewriterText.value.clamp(0, 1) * (totalLen + extraLengthForBlinks))
    //         .round();
    // //print(DateTime.now().toString() + " TypeWriterValue: " + typewriterValue.toString());
    // var showCursor = true;
    // var visibleString = text;
    // int count = 0;

    // if (typewriterValue == 0 ||
    //     typewriterValue == totalLen + extraLengthForBlinks) {
    //   visibleString = '';
    //   //visibleString = textCharacters.string;
    //   showCursor = false;
    // } else if (typewriterValue < textLen) {
    //   visibleString = textCharacters.take(typewriterValue).toString();
    // } else if (typewriterValue >= textLen && typewriterValue < lenWithBlinks) {
    //   showCursor = (typewriterValue - textLen) % 2 == 0;
    // } else {
    //   count = typewriterValue - totalLen - extraLengthForBlinks;
    //   count *= -1;

    //   visibleString = textCharacters.take(count).toString();
    // }

    final textLen = textCharacters.length;
    final typewriterValue =
        (_typewriterText.value.clamp(0, 1) * (textCharacters.length)).round();

    var showCursor = true;
    var visibleString = text;
    int count = 0;
    if (typewriterValue == 0) {
      visibleString = textCharacters.string;
      showCursor = false;
    }
    // else if (typewriterValue > textLen) {
    //   showCursor = (typewriterValue - textLen) % 2 == 0;
    // }
    else {
      count = typewriterValue - textLen ;
      count *= -1;
      visibleString = textCharacters.take(count).toString();
    }

    // if (typewriterValue == 0 ||
    //     typewriterValue == textLen + extraLengthForBlinks) {
    //   visibleString = '';
    //   //visibleString = textCharacters.string;
    //   showCursor = false;
    // } else if (typewriterValue > textLen) {
    //   showCursor = (typewriterValue - textLen) % 2 == 0;
    // } else if (typewriterValue < textLen) {
    //   visibleString = textCharacters.take(typewriterValue).toString();
    // } else {
    //   count = (textLen / 2).toInt() - (typewriterValue - textLen);
    //   visibleString = textCharacters.take(count).toString();
    // }
    // print("TypeWriterValue: " +
    //     typewriterValue.toString() +
    //     " Count: " +
    //     count.toString() +
    //     " Visible String: " +
    //     visibleString);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: visibleString),
          TextSpan(
            text: cursor,
            style:
                showCursor ? null : const TextStyle(color: Colors.transparent),
          )
        ],
        style: DefaultTextStyle.of(context).style.merge(textStyle),
      ),
      textAlign: textAlign,
    );
  }
}
