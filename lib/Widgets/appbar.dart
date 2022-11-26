import 'package:flutter/material.dart';
import 'package:meweb/Navigation/headerBar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> headerTexts;
  final double maxWidth;
  const CustomAppBar({Key? key, required this.maxWidth, required this.headerTexts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.centerLeft,
        //color: Colors.transparent,
        width: maxWidth,
        //height: 200,
        child: HeaderBar(headerTexts: headerTexts,),
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => Size(200, kToolbarHeight);
}
