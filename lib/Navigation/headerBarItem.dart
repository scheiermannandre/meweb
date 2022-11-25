import 'package:flutter/material.dart';

/// [HeaderBarItem] is the smallest widget in 'AdaptiveNavBar'
///
/// This widget accepts text which will be displayed
/// as a popupmenu option in phone view
/// and as a navbar item in wide view.
class HeaderBarItem extends InkWell {
  /// [item] will be displayed either in popupmenu option
  /// or as a navbar item in wideview
  final Widget item;

  /// `NavBarItem`'s named constructor
  HeaderBarItem({
    required this.item,
    Key? key,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureTapDownCallback? onTapDown,
    GestureTapCancelCallback? onTapCancel,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
    MouseCursor? mouseCursor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    MaterialStateProperty<Color?>? overlayColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    bool? enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    ValueChanged<bool>? onFocusChange,
    bool autofocus = false,
  }) : super(
          key: key,
          child: _NavBarItemChild(item: item),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          onHighlightChanged: onHighlightChanged,
          onHover: onHover,
          mouseCursor: mouseCursor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          overlayColor: overlayColor,
          splashColor: splashColor,
          splashFactory: splashFactory,
          radius: radius,
          borderRadius: borderRadius,
          customBorder: customBorder,
          enableFeedback: enableFeedback ?? true,
          excludeFromSemantics: excludeFromSemantics,
          focusNode: focusNode,
          canRequestFocus: canRequestFocus,
          onFocusChange: onFocusChange,
          autofocus: autofocus,
        );
}

/// [_NavBarItemChild] is the child of [HeaderBarItem]
class _NavBarItemChild extends StatelessWidget {
  /// [item] is displayed as a popupmenuitem or navbaritem in wide screen.
  final Widget item;

  /// `_NavBarItemChild`'s named constructor
  const _NavBarItemChild({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: item),
    );
  }
}

class HeaderBarTextItem extends StatefulWidget {
  final String text;
  const HeaderBarTextItem({Key? key, required this.text}) : super(key: key);

  @override
  State<HeaderBarTextItem> createState() => _HeaderBarTextItemState(text);
}

class _HeaderBarTextItemState extends State<HeaderBarTextItem> {
  final String text;

  _HeaderBarTextItemState(this.text);
  late bool showBold = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      onHover: ((value) => {
            setState(
              () {
                showBold = value;
              },
            )
          }),
      child: Text(
        text,
        style: TextStyle(
            color: showBold ? Colors.white : null,
            fontWeight: showBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
