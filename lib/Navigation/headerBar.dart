import 'package:flutter/material.dart';
import 'package:meweb/Navigation/headerBarItem.dart';

class HeaderBar extends StatefulWidget {
  final List<String> headerTexts;
  const HeaderBar({Key? key, required this.headerTexts}) : super(key: key);

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  late List<String> headerTexts = widget.headerTexts;

  List<Widget> buildHeaderItems() {
    List<Widget> headerItems = [];
    headerTexts.asMap().forEach((index, value) => {
          headerItems.add(HeaderBarTextItem(text: value)),
          if (index < headerTexts.length - 1)
            {headerItems.add(VerticalDivider(thickness: 1))}
        });

    return headerItems;
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    if (sw > 800.toDouble()) {
      return IntrinsicHeight(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: buildHeaderItems()));
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [HeaderBarItem(item: const Icon(Icons.menu))],
      );
    }
  }
}
