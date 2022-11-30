import 'package:flutter/material.dart';
import 'package:meweb/Navigation/headerBarItem.dart';

class HeaderBar extends StatefulWidget {
  final List<String> headerTexts;
  final Function()? onTap;
  const HeaderBar({Key? key, required this.headerTexts, required this.onTap})
      : super(key: key);

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> with TickerProviderStateMixin {
  late List<String> headerTexts = widget.headerTexts;
  late Function()? onTap = widget.onTap;

  List<Widget> buildHeaderItems() {
    List<Widget> headerItems = [];
    headerTexts.asMap().forEach((index, value) => {
          headerItems.add(HeaderBarTextItem(text: value)),
          if (index < headerTexts.length - 1)
            {headerItems.add(const VerticalDivider(thickness: 1))}
        });

    return headerItems;
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  bool onHamburgerHover = false;
  late AnimationController _animationController;
  bool isPlaying = false;
  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    if (sw > 800.toDouble()) {
      return  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: buildHeaderItems());
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeaderBarItem(
            item: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
              color: onHamburgerHover ? Colors.white : Colors.grey[500],
            ),
            onTap: () {
              onTap!();
              _handleOnPressed();
            },
            onHover: ((value) {
              setState(() {
                onHamburgerHover = value;
              });
            }),
          )
        ],
      );
    }
  }
}
