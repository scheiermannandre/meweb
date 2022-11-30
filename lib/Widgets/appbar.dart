import 'package:flutter/material.dart';
import 'package:meweb/Navigation/headerBar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> headerTexts;
  final double maxWidth;
  final Color backgroundColor;
  const CustomAppBar(
      {Key? key, required this.maxWidth, required this.headerTexts, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
        color:backgroundColor,
        width: maxWidth,
        child: Align(
          alignment: Alignment.centerLeft,
          child: HeaderBar(
            headerTexts: headerTexts,
            onTap: () {},
          ),
        ),
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => Size(200, kToolbarHeight);
}
