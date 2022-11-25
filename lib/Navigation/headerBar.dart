import 'package:flutter/material.dart';
import 'package:meweb/Navigation/headerBarItem.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({Key? key}) : super(key: key);

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    if (sw > 800.toDouble()) {
      return IntrinsicHeight(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HeaderBarTextItem(
            text: "01 : Home",
          ),
          VerticalDivider(
            thickness: 1,
          ),
          HeaderBarTextItem(
            text: "02 : About me",
          ),
          VerticalDivider(
            thickness: 1,
          ),
          HeaderBarTextItem(
            text: "03 : Projects",
          ),
          VerticalDivider(
            thickness: 1,
          ),
          HeaderBarTextItem(
            text: "04 : Blog",
          ),
        ],
      ));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [HeaderBarItem(item: const Icon(Icons.menu))],
      );
    }
  }
}
