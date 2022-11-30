import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:meweb/Navigation/headerBarItem.dart';
import 'package:meweb/Widgets/animated_introduction.dart';
import 'package:meweb/Widgets/custom_drawer.dart';
import '../Navigation/headerBar.dart';

class CoreScaffold extends StatefulWidget {
  final Widget body;

  const CoreScaffold({Key? key, required this.body}) : super(key: key);

  @override
  State<CoreScaffold> createState() => _CoreScaffoldState();
}

class _CoreScaffoldState extends State<CoreScaffold>
    with SingleTickerProviderStateMixin {
  late Widget body = widget.body;
  final List<String> pages = [
    "01 : Home",
    "02 : About me",
    "03 : Projects",
    "04 : Blog"
  ];
  double maxWidth = 1200.toDouble();
  bool onHamburgerHover = false;

  List<Widget> buildHeaderItems() {
    List<Widget> headerItems = [];
    pages.asMap().forEach((index, value) => {
          headerItems.add(HeaderBarTextItem(text: value)),
          if (index < pages.length - 1)
            {headerItems.add(const VerticalDivider(thickness: 1))}
        });

    return headerItems;
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    EdgeInsets padding = const EdgeInsets.fromLTRB(20, 0, 20, 0);
    Color headerDrawerBackground = const Color.fromARGB(225, 0, 0, 0);
    double appbarHeight = 75;
    return Scrollbar(
      controller: controller,
      thickness: 5,
      //trackVisibility: true,
      thumbVisibility: true,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: appbarHeight,
          backgroundColor: headerDrawerBackground,
          title: Container(
            color: Colors.transparent,
            width: double.infinity,
            alignment: Alignment.center,
            child: Container(
              padding: padding,
              color: Colors.transparent,
              width: maxWidth,
              child: Align(
                alignment: Alignment.centerLeft,
                child: HeaderBar(
                  headerTexts: pages,
                  onTap: (() {
                    if (_key.currentState!.isEndDrawerOpen) {
                      _key.currentState?.closeEndDrawer();
                    } else {
                      _key.currentState?.openEndDrawer();
                    }
                  }),
                ),
              ),
            ),
          ),
        ),
        body: Scaffold(
          key: _key,
          endDrawer: Padding(
            padding: EdgeInsets.fromLTRB(0, appbarHeight, 0, 0),
            child: CustomDrawer(
              padding: padding,
              drawerBackgroundColor: headerDrawerBackground,
              sidebarTexts: pages,
            ),
          ),
          body: Center(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        center: Alignment.bottomCenter,
                        radius: 1.5,
                        colors: [
                      Color.fromARGB(255, 13, 35, 61),
                      Colors.black,
                    ])),
                child: Metaballs(
                  effect: MetaballsEffect.follow(),
                  glowRadius: 1,
                  glowIntensity: 0.3,
                  maxBallRadius: 35,
                  minBallRadius: 15,
                  metaballs: 80,
                  speedMultiplier: 1,
                  bounceStiffness: 3,
                  color: Colors.grey,
                  gradient: const LinearGradient(colors: [
                    Color(0xFF5e2028),
                    //Color.fromARGB(0, 237, 133, 68),
                    //Color(0x00110916),
                    //Color(0x004fb2e7),
                    //Color(0x0067383b),
                  ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: maxWidth,
                      padding: padding,
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(height: 75, color: Colors.transparent),
                            const Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Wrap(
                              children: [
                                const Text(
                                  "I am ",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                AnimatedIntroduction(
                                  textsForAnimation: const [
                                    "André Scheiermann",
                                    "a Software Engineer",
                                    "a Sport Entusiast",
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
