import 'package:flutter/material.dart';
import 'package:meweb/Navigation/headerBarItem.dart';

class CustomDrawer extends StatefulWidget {
  final List<String> sidebarTexts;
  final EdgeInsets padding;
  final Color drawerBackgroundColor;
  const CustomDrawer(
      {Key? key,
      required this.sidebarTexts,
      required this.padding,
      required this.drawerBackgroundColor})
      : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  late List<String> sidebarTexts = widget.sidebarTexts;
  late EdgeInsets padding = widget.padding;
  late Color drawerBackgroundColor = widget.drawerBackgroundColor;
  bool onHamburgerHover = false;
  List<Widget> buildSideBar() {
    List<Widget> sideBarItems = [];
    
    for (var element in sidebarTexts) {
      sideBarItems.add(HeaderBarTextItem(text: element));
    }
    return sideBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: drawerBackgroundColor,
      child: SizedBox(
        width: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildSideBar()),
      ),
    );
  }
}
